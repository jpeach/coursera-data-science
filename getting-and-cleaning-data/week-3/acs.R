library('httr')
library('readr')
library('dplyr')

printf <- function(...) {
    invisible(print(sprintf(...)))
}

get.csv <- function(url) {
    response <- GET(url)
    content(response, as = 'parsed')
}

acs.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
acs.data <- get.csv(acs.url)

# Create a logical vector that identifies the households on greater than
# 10 acres who sold more than $10,000 worth of agriculture products.
#   ACR == 3:  House on ten or more acres
#   AGS == 6: Sales $10000+

agricultureLogical <-
    mutate(acs.data, acr_ags_10 = (ACR == 3 & AGS == 6)) %>% 
    select(acr_ags_10)

# Assign that logical vector to the variable agricultureLogical.
agricultureLogical <- agricultureLogical$acr_ags_10

printf(
    "What are the first 3 values that result from  which(agricultureLogical)? %s",
    head(which(agricultureLogical), n = 3)
)