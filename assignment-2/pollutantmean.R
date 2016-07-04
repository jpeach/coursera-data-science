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
    
    # list.files returns sorted names, so we can just subset by the id vector.
    files <- list.files(directory)[id]
}
