# Write a function that reads a directory full of files and reports
# the number of completely observed cases in each data file. The
# function should return a data frame where the first column is the
# name of the file and the second column is the number of complete
# cases.

#' Report completely observes cases for each data file.
#'
#' @param directory A character vector of length 1 indicating the location of the CSV files.
#' @param id An integer vector indicating the monitor ID numbers to be used.
#'
#' @return A data frame where 'id' is the monitor ID and 'nobs' is the number
#'      of complete cases.
complete <- function(directory, id = 1:332) {
}


# Sample output (nobs == number of observations):
# 
# source("complete.R")
# complete("specdata", 1)
# ##   id nobs
# ## 1  1  117
# complete("specdata", c(2, 4, 8, 10, 12))
# ##   id nobs
# ## 1  2 1041
# ## 2  4  474
# ## 3  8  192
# ## 4 10  148
# ## 5 12   96
# complete("specdata", 30:25)
# ##   id nobs
# ## 1 30  932
# ## 2 29  711
# ## 3 28  475
# ## 4 27  338
# ## 5 26  586
# ## 6 25  463
# complete("specdata", 3)
# ##   id nobs
# ## 1  3  243
