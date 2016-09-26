library('httr')
library('readr')
library('dplyr')

printf <- function(...) {
    invisible(print(sprintf(...)))
}

fetch <- function(url) {
    response <- GET(url)
    content(response, as = 'parsed', col_names = TRUE)
}

raw <- function(url) {
    response <- GET(url)
    content(response, as = 'raw')
}

# The GDP CSV looks like this:
#
# ,Gross domestic product 2012,,,,,,,,
# ,,,,,,,,,
# ,,,,(millions of,,,,,
#      ,Ranking,,Economy,US dollars),,,,,
# ,,,,,,,,,
# USA,1,,United States," 16,244,600 ",,,,,
# CHN,2,,China," 8,227,103 ",,,,,
# JPN,3,,Japan," 5,959,718 ",,,,,

gdp.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
gdp.raw <- raw(gdp.url)

gdp.names = c('CountryCode', 'Ranking', 'X1', 'CountryName', 'GDP')
gdp.types = c(col_character(), col_number(), col_guess(), col_character(), col_number())

# Load data for the *190* ranked countries.
gdp.data = read_csv(gdp.raw, skip = 5, n_max = 190, col_names = gdp.names, col_types = gdp.types)
# Remove the fake X1 column.
gdp.data <- select(gdp.data, -X1)

edu.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
edu.data <- fetch(edu.url)

# Match the data based on the country shortcode. How many of the IDs match?
joined <- inner_join(gdp.data, edu.data, by = c('CountryCode'))
printf("how many of the IDs match? %s", nrow(joined))

# Sort the data frame in descending order by GDP rank.
joined <- arrange(joined, desc(Ranking))

# What is the 13th country in the resulting data frame?
printf("The 13th country is? %s", joined[13,]$CountryName)

# Rename the "Income Group" variable for convenience.
joined <- rename(joined, IncomeGroup = `Income Group`)

# What is the average GDP ranking for the "High income: OECD"
# and "High income: nonOECD" group?

printf("Average GDP rank (High income: OECD): %s",
    filter(joined, IncomeGroup == "High income: OECD") %>% summarize(mean(Ranking))
)

printf("Average GDP rank (High income: nonOECD): %s",
    filter(joined, IncomeGroup == "High income: nonOECD") %>% summarize(mean(Ranking))
)

printf("How many countries with the highest GDP? %s",
    nrow(
        mutate(joined, Ranking.Quantile = ntile(Ranking, 5)) %>%
        filter(Ranking.Quantile == 1)
    )
)
# Cut the GDP ranking into 5 separate quantile groups.
l <- mutate(joined, Ranking.Quantile = ntile(Ranking, 5)) %>% # Cut into 5 groups
    filter(Ranking.Quantile == 1) %>% # Last group is group 1 (highest income)
    filter(IncomeGroup == "Lower middle income")


printf("How many countries are Lower middle income but among the 38 nations with highest GDP? %s",
       nrow(l)
)