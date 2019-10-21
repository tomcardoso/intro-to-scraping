load_requirements <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, 'Package'])]
  if (length(new.pkg))
      install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c('here', 'tidyverse')

load_requirements(packages)

data <- read_csv(here::here('assets', 'statcan.csv')) %>%
  rename(year = 'Labour force participation rate for women aged 15 to 44 whose youngest child in the household was under 3 years of age, Quebec and Ontario, 1996 to 2016, %') %>%
  mutate(difference = Ontario - Quebec) %>%
  select(year, difference)

write_csv(data, here::here('assets', 'statcan_new.csv'))
