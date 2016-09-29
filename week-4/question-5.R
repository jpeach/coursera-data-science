library(quantmod)
library(lubridate)

printf <- function(...) {
    invisible(print(sprintf(...)))
}
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)

# How many values were collected in 2012?
printf("%d values were collected in 2012", sum(year(ymd(sampleTimes)) == 2012))

# How many values were collected on Mondays in 2012?
# wday returns the day of the week as a decimal number (01-07, Sunday is 1) 

# Make it a data frame  can subset.
sampleTimes <- data.frame(dates = ymd(sampleTimes))
printf("%s values were collected on Mondays in 2012",
    length(sampleTimes[year(s$dates) == 2012 & wday(s$dates) == 2,])
)