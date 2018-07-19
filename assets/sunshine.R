rm(list=ls())

library('tidyverse')

setwd('~/Sites/personal/intro-to-scraping/assets')

data <- read_csv('en-2017-pssd-compendium-20180320-utf8.csv') %>%
  rename(
    sector = 'Sector',
    last_name = 'Last Name',
    first_name = 'First Name',
    salary_paid = 'Salary Paid',
    taxable_benefits = 'Taxable Benefits',
    employer = 'Employer',
    job_title = 'Job Title',
    calendar_year = 'Calendar Year'
  ) %>%
  mutate(
    salary_parsed = parse_number(salary_paid),
    taxable_benefits_parsed = parse_number(taxable_benefits),
    combined_income = salary_parsed + taxable_benefits_parsed,
    id = row_number()
  )

david <- data %>%
  filter(grepl('David', first_name)) %>%
  mutate(is_david = 'yes')

non_david <- data %>%
  filter(!(id %in% david$id)) %>%
  mutate(is_david = 'no')

davids <- bind_rows(david, non_david) %>%
  group_by(is_david) %>%
  summarise(median = median(combined_income)) %>%
  spread(is_david, median) %>%
  select(yes, no) %>%
  mutate(difference = yes - no)

top_names <- data %>%
  group_by(first_name) %>%
  filter(n() > 100) %>%
  summarise(median = median(combined_income)) %>%
  arrange(desc(median))
