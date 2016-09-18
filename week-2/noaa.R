library('httr')
library('readr')

noaa.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

noaa.text <- content(GET(noaa.url), as = "text")

# Example data (column numbering added)
# 1  Weekly SST data starts week centered on 3Jan1990
# 2
# 3                 Nino1+2      Nino3        Nino34        Nino4
# 4  Week          SST SSTA     SST SSTA     SST SSTA     SST SSTA
# 5          1         2         3         4         5         6
# 6 12345678901234567890123456789012345678901234567890123456789012
# 7  03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
# 8  10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3
# 9  17JAN1990     24.2-0.3     25.3-0.3     26.5-0.1     28.6 0.3

noaa.positions <- fwf_positions(
    start=c(2, 16, 20, 29, 33, 42, 46, 55, 59),
    end=c(10, 19, 23, 32, 36, 45, 49, 58, 62),
    col_names=c("week", "Nino12.SST", "Nino12.SSTA",
        "Nino3.SST", "Nino3.SSTA", "Nino34.SST",
        "Nino34.SSTA", "Nino4.SST", "Nino4.SSTA"
    )
)

noaa.types <- c(col_character(),
    col_double(), col_double(), col_double(), col_double(),
    col_double(), col_double(), col_double(), col_double())

d <- read_fwf(noaa.text, skip=4,
    col_positions = noaa.positions,
    col_types = noaa.types)

print(sprintf("sum of the 4th column: %f", sum(d[4])))