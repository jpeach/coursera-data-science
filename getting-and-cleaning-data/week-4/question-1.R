library(httr)

acs.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
acs.data <- content(GET(acs.url), as = 'parsed')

# Apply strsplit() to split all the names of the data frame on the characters "wgtp"
acs.split <- strsplit(names(acs.data), split = "wgtp")

print(sprintf("value of 123rd element is:"))
print(acs.split[[123]])