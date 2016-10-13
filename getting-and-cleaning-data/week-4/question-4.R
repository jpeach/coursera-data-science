library(httr)
library(readr)
library(dplyr)
library(lubridate)

# Using GDP data CSV parting from week-3 ...
gdp.load <- function(url) {
    gdpNames <- c('CountryCode', 'Ranking', 'X1', 'CountryName', 'GDP')
    gdpTypes <- c(col_character(), col_number(), col_guess(), col_character(), col_number())
    gdpRaw <- content(GET(gdp.url), as = 'raw')
    
    # Load data for the *190* ranked countries.
    gdpValues <- read_csv(gdpRaw, skip = 5, n_max = 190, col_names = gdpNames, col_types = gdpTypes)
    
    # Remove the fake X1 column.
    select(gdpValues, -X1)
}
    
gdp.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
gdp.data <- tbl_df(gdp.load(gdp.url))

edu.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
edu.data <- tbl_df(content(GET(edu.url), as = 'parsed', col_names = TRUE))

# Match the data based on the country shortcode
joined <- inner_join(gdp.data, edu.data, by = c('CountryCode'))

# Of the countries for which the end of the fiscal year is available, how many end in June?

# Fiscal year is in Special Notes
joined <- rename(joined, SpecialNotes = `Special Notes`)

# Strip just the month and data from a string like:
#   "Fiscal year end: July 14; reporting period for national accounts data: FY."
# into
#   July 14 2016
yearEnds <- gsub('.*: ([A-Za-z0-9 ]+);.*',
    sprintf('%s %s', '\\1', year(now())),
    filter(joined, grepl('^Fiscal', SpecialNotes))$SpecialNotes,
    perl = TRUE)

# Get the month numbers
fiscalMonths <- month(mdy(yearEnds))

# Get the count of 6's (ie. June)
invisible(print(sprintf("%d fiscal years end in June", sum(fiscalMonths == 6))))