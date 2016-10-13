library("httr")
library("jsonlite")

github.config = add_headers(Authorization = "token f53417f47c76d2ddce8c423b8a1bbfe72a9790d5")
github.url = "https://api.github.com"

github.get <- function(uri) {
    GET(paste(github.url, uri, sep="/"), config=github.config)
}

# # Pull the repositorry data.
# leek = github.get("users/jtleek/repos")
# 
# # Convert from JSON
# leek <- fromJSON(content(leek, as = "text"))
# 
# # Subset on the repo name
# d = subset(leek, name == "datasharing")
# 
# # Creation time
# id$created_at