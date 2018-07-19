rm(list=ls())

library('tidyverse')
library('rvest')
library('downloader')

setwd('~/Sites/personal/intro-to-scraping/assets')

budgets <- read_html('https://www.budget.gc.ca/pdfarch/index-eng.html') %>%
  html_nodes('.docType ul li a')

budgets_text <- budgets %>%
  html_text()

budgets_links <- budgets %>%
  html_attr('href')

budget_data <- data_frame(text = budgets_text, url = budgets_links) %>%
  filter(text == 'Budget in Brief') %>%
  filter(grepl('http', url)) %>%
  mutate(id = row_number()) %>%
  slice(1:5)

for (i in seq(nrow(budget_data))) {
  url <- budget_data[i, 2] %>% pull()
  id <- budget_data[i, 3] %>% pull()
  download(url, paste(id, '.pdf', sep = ''), quiet = FALSE, mode = 'wb')
}
