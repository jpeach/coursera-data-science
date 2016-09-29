library(httr)
library(readr)
library(dplyr)

# Using GDP data CSV parting from week-3 ...
gdp.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
gdp.raw <- content(GET(gdp.url), as = 'raw')

gdp.names = c('CountryCode', 'Ranking', 'X1', 'CountryName', 'GDP')
gdp.types = c(col_character(), col_number(), col_guess(), col_character(), col_number())

# Load data for the *190* ranked countries.
gdp.data = read_csv(gdp.raw, skip = 5, n_max = 190, col_names = gdp.names, col_types = gdp.types)

# Remove the fake X1 column.
gdp.data <- select(gdp.data, -X1)

# what is a regular expression that would allow you to count the number of countries
# whose name begins with "United"?
countryNames <- gdp.data$CountryName
countryMatch <- '^United'

print(sprintf("regex '%s' has %d matches", countryMatch, length(grep(countryMatch, countryNames))))