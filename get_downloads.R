# Fetch download count for MPCR1
#library(cranlogs)
# Specify the date range
#downloads <- cran_downloads("MPCR1", from = "2024-09-01", to = "2024-11-12")
#count <- sum(downloads$count)
# Output the download count
#print(paste("Total downloads for MPCR1:", count))

# Load required library
library(cranlogs)

# Fetch download count for MPCR1
downloads <- cran_downloads("MPCR1", from = "2024-09-01", to = "2024-11-12")
count <- sum(downloads$count)

# Define the markers in the README file
start_marker <- "<!--downloads-->"
end_marker <- "<!--downloads-end-->"
readme_file <- "README.md"

# Read the current content of the README file
readme_content <- readLines(readme_file)

# Locate the start and end markers
start_idx <- grep(start_marker, readme_content)
end_idx <- grep(end_marker, readme_content)

# Ensure markers exist and are valid
if (length(start_idx) == 1 && length(end_idx) == 1 && start_idx < end_idx) {
  # Prepare the updated content
  new_content <- paste0("**Total downloads this month**: ", count)
  
  # Replace content between markers
  readme_content <- c(
    readme_content[1:start_idx],
    new_content,
    readme_content[end_idx:length(readme_content)]
  )
  
  # Write the updated content back to the README file
  writeLines(readme_content, readme_file)
  message("README.md updated successfully.")
} else {
  stop("Error: Markers <!--downloads--> and <!--downloads-end--> not found or incorrectly placed.")
}
