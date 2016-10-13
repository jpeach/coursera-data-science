library("httr")
library("readr")

acs.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

acs.get <- function() {
    response = GET(acs.url)
    content(response, as = "parsed")    
}

acs <- acs.get()