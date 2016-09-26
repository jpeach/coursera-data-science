library('httr')
library('jpeg')

printf <- function(...) {
    invisible(print(sprintf(...)))
}

fetch <- function(url) {
    response <- GET(url)
    content(response, as = 'raw')
}

data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
data.raw <- fetch(data.url)

jeff <- readJPEG(data.raw, native = TRUE)

#What are the 30th and 80th quantiles of the resulting data?
q <- quantile(jeff, probs = c(0.30, 0.80))

printf("30th quantile: %s", q[['30%']])
printf("80th quantile: %s", q[['80%']])