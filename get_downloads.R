# Check if 'cranlogs' package is installed, if not, install it
if (!require(cranlogs)) {
  install.packages("cranlogs")
}

# Check if 'devtools' package is installed, if not, install it
if (!require(devtools)) {
  install.packages("devtools")
}

# Load the libraries
library(cranlogs)
library(devtools)

# Get the number of downloads for the past month
downloads <- cran_downloads("MPCR1", from = "2024-09-01", to = "2024-11-12")

# Get the total count
count <- sum(downloads$count)

# Write the count to a text file
write(count, "downloads.txt")
