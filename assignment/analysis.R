library(readr)
library(dplyr)

printf <- function(...) {
    invisible(print(sprintf(...)))
}

# The current working directory needs to be the 'UCI HAR Dataset'
# directory containing the extracted files from:
#
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

stopifnot(file.exists('features.txt'))
stopifnot(file.exists('activity_labels.txt'))

# Read features.txt to get the names for the data columns. We use
# read.table rather than read_table because read.table separates by
# arbitrary whitespace and read_table assumes fixed-width columns.
readFeatures <- function() {
    featuresTable <- read.table(
        'features.txt', header = FALSE,
        col.names = c('FeatureId', 'FeatureName'),
        colClasses = c('integer', 'character'))

    # Return a vector of feature names.
    featuresTable$FeatureName
}

# Read activity_labels.txt to get the activity names.
readActivities <- function() {
    activityTable <- read.table(
        'activity_labels.txt', header = FALSE,
        col.names = c('FeatureId', 'FeatureName'),
        colClasses = c('integer', 'character'))

    activityTable
}

# Given directory = 'foo' and base = 'bar', return 'foo/base_foo.txt'.
makeDatasetPath <- function(directory, base) {
    paste(directory, paste(base, '_', directory, '.txt', sep = ''), sep = '/')
}

# Read a UCI dataset from the given directory.
readDataset <- function(directory) {
    # Path to the sample values.
    dataPath <- makeDatasetPath(directory, 'X')

    # Read the data values. Don't bother naming the columns
    # since they have duplicate names that will get us into
    # trouble.
    dataValues <- read.table(dataPath, header = FALSE)

    # Now bind the activity and subject columns into the final data, returning
    # a dplyr data frame tbl.
    tbl_df(dataValues)
}

# Given a character vector of 'V1' ... 'Vxxx', extract the numeric
# portion and use that to subset the featureNames character vector.
convertColumnNames <- function(colNames, featureNames) {
    # Extract the numeric portion of the column name.
    colIndices <- gsub('V([0-9]+)', '\\1', colNames)
    # Convert to numeric.
    colIndices <- as.numeric(colIndices)
    # Subset the feature names with the indices from the column names.
    featureNames[colIndices]
}

# Read the activity metadata.
uci.meta.activity <- readActivities()
# Read the features metadata.
uci.meta.features <- readFeatures()

# Read the test and train datasets.
uci.dataset.test <- readDataset('test')
uci.dataset.train <- readDataset('train')

# Each row in each data frame is discrete observation so we can just
# concatenate the two data frames.
uci.dataset.combined <- bind_rows(uci.dataset.test, uci.dataset.train)

# The features contain measurements named -mean() and meanFreq(). From
# the code book, meanFreq() is "Weighted average of the frequency components
# to obtain a mean frequency" and mean() is "mean value". We are asked for
# the mean of a measurement, which strongly implies the latter, so we only
# take feature names with 'mean()'
meanCols <- grep('mean\\(\\)', uci.meta.features)
stdCols <- grep('std\\(\\)', uci.meta.features)

# Select the columns whose index matched a mean or standard deviation
# measurement and combine them into a new data frame.
uci.dataset.measurements <- bind_cols(
    uci.dataset.combined[,meanCols],
    uci.dataset.combined[,stdCols]
)

# The columns of the measurements dataset are called V1 ... Vnnn. Extract
# the numeric portion so that we can index back into the feature names.
# Fortunately, at this point there are no duplicae feature names.
names(uci.dataset.measurements) <- convertColumnNames(names(uci.dataset.measurements), uci.meta.features)
