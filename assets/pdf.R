load_requirements <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, 'Package'])]
  if (length(new.pkg))
      install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c('here', 'tidyverse', 'rvest', 'downloader')

load_requirements(packages)

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
  download(url, here::here('assets', paste(id, '.pdf', sep = '')), quiet = FALSE, mode = 'wb')
}
