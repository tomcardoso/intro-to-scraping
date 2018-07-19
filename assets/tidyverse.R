library('tidyverse')

setwd('~/Sites/personal/intro-to-scraping/assets')

data <- read_csv('statcan.csv') %>%
  rename(year = 'Labour force participation rate for women aged 15 to 44 whose youngest child in the household was under 3 years of age, Quebec and Ontario, 1996 to 2016, %') %>%
  mutate(difference = Ontario - Quebec) %>%
  select(year, difference)

write_csv(data, path = 'statcan_new.csv')
