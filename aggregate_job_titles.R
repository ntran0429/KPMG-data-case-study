# get the output of unique(CustomerDemographic$job_title)
# then feed it to ChatGPT to provide us with a mapping
# to create a new column called job_type


# Create a function to map job titles to groups
map_job_to_group <- function(job_title) {
  # Convert to lowercase for case-insensitive matching
  job_title <- tolower(job_title)
  
  # Managerial
  if (grepl("manager", job_title) | grepl("director", job_title) | 
      grepl("chief", job_title) | grepl("vp", job_title)) {
    return("Managerial")
  }
  
  # Technical
  if (grepl("engineer", job_title) | grepl("programmer", job_title) | 
      grepl("analyst", job_title) | grepl("developer", job_title) | 
      grepl("technician", job_title) | grepl("specialist", job_title) |
      grepl("database administrator", job_title) | grepl("technical architect", job_title)) {
    return("Technical")
  }
  
  # Administrative
  if (grepl("assistant", job_title) | grepl("coordinator", job_title) | 
      grepl("clerk", job_title) | grepl("secretary", job_title) |
      grepl("representative", job_title) | grepl("recruiter", job_title)) {
    return("Administrative")
  }
  
  # Quantitative
  if (grepl("biostatistician", job_title) | grepl("statistician", job_title) | 
      grepl("accountant", job_title) | grepl("financial analyst", job_title) |
      grepl("budget/accounting analyst", job_title) | grepl("actuary", job_title) |
      grepl("compensation analyst", job_title) | grepl("mathematician", job_title) |
      grepl("scientist", job_title)) {
    return("Quantitative")
  }
  
  # Healthcare
  if (grepl("nurse", job_title) | grepl("therapist", job_title) | 
      grepl("health", job_title) | grepl("food", job_title) |
      grepl("pathologist", job_title) | grepl("pharmacist", job_title)) {
    return("Healthcare")
  }
  
  # Other
  return("Other")
}

# Apply the mapping function to create a new column 'job_group'
CD_CA_rfm$job_type <- sapply(CD_CA_rfm$job_title, map_job_to_group)
final_dataset$job_type <- sapply(final_dataset$job_title, map_job_to_group)
NewCustomerList$job_type <- sapply(NewCustomerList$job_title, map_job_to_group)

# table(sapply(CustomerDemographic$job_title, map_job_to_group))


# get the customers whose job_title contains "analyst" in CustomerDemographic
# CustomerDemographic[grepl("Analyst", CustomerDemographic$job_title),]$job_title
# 
# 
# CustomerDemographic[grepl("", CustomerDemographic$job_title),]$job_title
