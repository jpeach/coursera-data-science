# Write a function that takes a directory of data files and a threshold
# for complete cases and calculates the correlation between sulfate
# and nitrate for monitor locations where the number of completely
# observed cases (on all variables) is greater than the threshold.
# The function should return a vector of correlations for the monitors
# that meet the threshold requirement. If no monitors meet the threshold
# requirement, then the function should return a numeric vector of
# length 0.
#
# For this function you will need to use the 'cor' function in R which
# calculates the correlation between two vectors. Please read the
# help page for this function via '?cor' and make sure that you know
# how to use it.

#' Calculates the correlation between sulfate and nitrate for monitor locations
#' where the number of completely observed cases (on all variables) is greater
#' than the threshold.
#
#' @param directory A character vector of length 1 indicating the location of
#'      the CSV files.
#' @param threshold A numeric vector of length 1 indicating the number of
#'      completely observed observations (on all variables) required to compute
#'      the correlation between nitrate and sulfate.
#'
#' @return A numeric vector of correlations.
corr <- function(directory, threshold = 0) {
    if (!is.character(directory)) stop('directory must be a character')
    if (!is.numeric(threshold)) stop('threshold must be numeric')

    # Accumulator for our data frames.
    result <- numeric(0)

    # For each file is the directory ...
    for (fname in list.files(directory, full.names = TRUE)) {
        # Read it as CSV.
        data <- read.csv(fname)

        # Select the rows that have no NA values.
        complete <- data[complete.cases(data), ]

        # If we have enough rows, append the correlation.
        if (nrow(complete) > threshold) {
            result[length(result) + 1] <- cor(complete$sulfate, complete$nitrate)
        }
    }

    result
}

#  source("corr.R")
#  source("complete.R")
#  cr <- corr("specdata", 150)
#  head(cr)
#  ## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
#  summary(cr)
#  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  ## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
#  cr <- corr("specdata", 400)
#  head(cr)
#  ## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
#  summary(cr)
#  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  ## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
#  cr <- corr("specdata", 5000)
#  summary(cr)
#  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  ##
#  length(cr)
#  ## [1] 0
#  cr <- corr("specdata")
#  summary(cr)
#  ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  ## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
#  length(cr)
#  ## [1] 323
