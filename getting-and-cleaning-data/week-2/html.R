library("httr")
library("XML")

printf <- function(...) invisible(print(sprintf(...)))

response <- GET("http://biostat.jhsph.edu/~jleek/contact.html")

# Split into lines
lines <- scan(
    text = content(response, as="text"),
    sep = "\n",
    what = "character",
    blank.lines.skip = FALSE)

# Print 10th, 20th, 30th and 100th of the body. Note that
# this is not the *html*.
for (i in c(10, 20, 30, 100)) {
    printf("length of %dth line: %d", i, nchar(lines[i]))
}