# Fetch and unpack the assignment data.
fetchData <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
    tmp <- tempfile()

    # Fetch the file to a temporary filename.
    download.file(url, tmp)

    # Unzip to "./specdata".
    if (!dir.exists("specdata")) {
        dir.create("specdata", mode="0755")
    }

    unzip(tmp, exdir="specdata", junkpaths=TRUE)

    # Remove the temporary file.
    file.remove(tmp)
}
