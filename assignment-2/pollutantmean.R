#' Find the the mean of a pollutant.
#'
#' @param directory A character vector of length 1 indicating the location of the CSV files.
#' @param pollutant A character vector of length 1 indicating the name of the pllutant for
#'              which we will calculate the mean; either "sulfate or "nitrate".
#' @param id An integer vector indicating the monitor ID numbers to be used.
#' 
#' @return The mean of the pollutant across all monitors listed in the 'id' vector.
pollutantmean <- function(directory, pollutant, id = 1:322) {
    # First, do some type checking.
    if (!is.character(directory)) stop('directory must be a character')
    if (!is.character(pollutant)) stop('pollutant must be a character')
    if (!is.numeric(id)) stop('id must be a numeric vector')
    
    samples <- numeric()

    # list.files returns sorted names, so we can just subset by the id vector.
    files <- list.files(directory, full.names = TRUE)[id]
    for (f in files) {
        # Read the file into a data frame.
        data <- read.csv(f)
        # Subset the a vector of the pollutant we want. Subsetting data gives
        # us a data frame, so we index the single column to get a numeric vector.
        p <- data[pollutant][,1]
        # Append to our total samples.
        samples = append(samples, p[!is.na(p)])
    }
    
    # Return the mean of the accumulated samples.
    mean(samples)
}

# Sample output:
# 
# source("pollutantmean.R")
# pollutantmean("specdata", "sulfate", 1:10)
# ## [1] 4.064
# pollutantmean("specdata", "nitrate", 70:72)
# ## [1] 1.706
# pollutantmean("specdata", "nitrate", 23)
# ## [1] 1.281