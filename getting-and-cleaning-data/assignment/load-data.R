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
readDataset <- function(directory, featureNames) {
    # Path to the sample values.
    dataPath <- makeDatasetPath(directory, 'X')
    # Path to the activities for each sample.
    activityPath <- makeDatasetPath(directory, 'y')
    # Path to the subject for each sample.
    subjectPath <- makeDatasetPath(directory, 'subject')

    dataValues <- read.table(
        dataPath, header = FALSE, col.names = featureNames)
    activityValues <- read.table(
        activityPath, header = FALSE, col.names = c('ActivityId'))
    subjectValues <- read.table(
        subjectPath, header = FALSE, col.names = c('SubjectId'), colClasses = c('integer'))

    # Now bind the activity and subject columns into the final data, returning
    # a dplyr data frame tbl.
    tbl_df(cbind(dataValues, activityValues, subjectValues))
}

# Read the activity metadata.
uci.meta.activity <- readActivities()
# Read the features metadata.
uci.meta.features <- readFeatures()

# Read the test and train datasets.
uci.dataset.test <- readDataset('test', uci.meta.features)
uci.dataset.train <- readDataset('train', uci.meta.features)

# Each row in each data frame is discrete observation so we can just
# concatenate the two data frames.
uci.dataset.combined <- bind_rows(uci.dataset.test, uci.dataset.train)
