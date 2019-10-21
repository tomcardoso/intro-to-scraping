load_requirements <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, 'Package'])]
  if (length(new.pkg))
      install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c('here', 'tidyverse', 'rvest')

load_requirements(packages)

homepage <- 'https://www.theglobeandmail.com'

globe <- read_html(homepage) %>%
  html_nodes('a.o-card__link') %>%
  html_attr('href') %>%
  as.tibble() %>%
  distinct() %>%
  mutate(id = row_number()) %>%
  slice(1:5) %>%
  mutate(author = NA)

scrape_inner_page <- function(row, url) {

  page <- read_html(paste('https://www.theglobeandmail.com/', url, sep = '')) %>%
    html_nodes('.c-article-meta__bylines > a') %>%
    html_text()

  return(page)

}

for (i in seq(nrow(globe))) {
  url <- globe[i, 1] %>% pull()
  id <- globe[i, 2] %>% pull()

  data <- scrape_inner_page(row, url)

  print('Sleeping for 3 seconds…')
  Sys.sleep(3)

  globe$author[i] <- ifelse(length(data) > 0, data, NA)

}
