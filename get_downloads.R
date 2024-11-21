# Fetch download count for MPCR1
library(cranlogs)

# Specify the date range
downloads <- cran_downloads("MPCR1", from = "2024-09-01", to = "2024-11-12")
count <- sum(downloads$count)

# Output the download count
print(paste("Total downloads for MPCR1:", count))
