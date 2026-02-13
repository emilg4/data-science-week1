# FIX 1: [Typos and capitalisation issues in variables 'site', 'treatment' and 'collector'] ====

# Show the problem:
mosquito_egg_raw |>
  distinct(treatment)

mosquito_egg_raw |>
  distinct(collector)

mosquito_egg_raw |>
  distinct(site)



# Fix it:
mosquito_egg_data_step1 <- mosquito_egg_raw |>
  mutate(
    treatment = stringr::str_to_title(treatment),
  
    collector = case_when(
      collector == "Garci" ~ "Garcia",
      collector == "Smyth" ~ "Smith",
      .default = as.character(collector)
    ),
    
    site = stringr::str_to_upper(site)
    )
  
  
  # YOUR CODE HERE
  
  
  # Verify it worked:
mosquito_egg_data_step1 |>
  distinct(treatment)   

mosquito_egg_data_step1 |>
  distinct(collector)

mosquito_egg_data_step1 |>
  distinct(site)
  
 
  # What changed and why it matters:
  # [All the variables now only have the first character as capitalised, this
  # matters as now there are less variables so it is easier for further
  # interpretation etc]
  #
  
  
  # FIX 2: [Duplicates]  ====

# Show the problem:
library(janitor)
mosquito_egg_data_step1 |>
  get_dupes()

# Fix it:
mosquito_egg_data_step2 <- mosquito_egg_data_step1 |>
  filter(!duplicated(across(everything())))
  
  
  # Verify it worked:
mosquito_egg_data_step2 |>
  get_dupes()
  
  # What changed and why it matters:
  # [Now the duplicated entries are now gone and no longer affect certain
  # statistical measures such as mean, median etc]
  