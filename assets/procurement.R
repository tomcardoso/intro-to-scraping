rm(list=ls())

library('tidyverse')
library('rvest')

setwd('~/Sites/personal/intro-to-scraping/assets')

# We'll get back to this URL later if we have time
index_page_url <- 'https://www.tpsgc-pwgsc.gc.ca/cgi-bin/proactive/cl.pl?lang=eng&SCR=Q&Sort=0'

# For now, let's focus on this page
contracts_url <- 'https://www.tpsgc-pwgsc.gc.ca/cgi-bin/proactive/cl.pl?lang=eng;SCR=L;Sort=0;PF=CL201617Q3.txt'

contracts_page <- read_html(contracts_url)

# Let's type `page` into the RStudio console and take a look. rvest has grabbed the HTML!

# Next, let's take a look at the page in Chrome Developer Tools and see if we can extract a selector we can grab

# Selector will look like this: '#wb-main-in > table'
# XPath looks like this: '//*[@id="wb-main-in"]/table'

# First, let's scrape the easy way, using `html_table`. This won't always work, especially if your data isn't actually in a table, but it's very powerful

contracts_table <- contracts_page %>%
  html_nodes('#wb-main-in > table') %>%
  # html_nodes(xpath = '//*[@id="wb-main-in"]/table') %>% # you could also write it using XPath this way
  html_table() %>%
  as.data.frame()

contracts_table_parsed <- contracts_table %>%
  rename(
    contract_date = 'Contract.Date',
    vendor_name = 'Vendor.Name',
    description = 'Description.of.Work',
    value = 'Contract.Value'
  ) %>%
  mutate(
    contract_date = as.Date(contract_date),
    value_no_spaces = str_replace_all(value, '\\s', ''),
    value = parse_number(value_no_spaces)
  )

travel_expenses <- 'https://www.tpsgc-pwgsc.gc.ca/proactive/voyage-travel/dv-th-182-eng.html'

travel_page <- read_html(travel_expenses)

# Now, if we grab the selector for the list items (<li>'s) from Dev Tools, we'll end up with something like this:
# '#wb-main-in > ul:nth-child(4) > li:nth-child(1) > a'
# Testing that out in the Chrome console reveals that it's only selecting that one list item — not what we want!
# Instead, let's rewrite that to be more general:
# '#wb-main-in > ul > li > a'
# Now we're grabbing *all* list items at once. Let's test it out:

travel_index <- travel_page %>%
  html_nodes('#wb-main-in > ul > li > a')

# One of the unfortunate caveats of rvest and the "tidy" approach is that it's not always very intuitive on how to do two things at once
# In this case, we want to both grab the "href" property of the anchor tag, as well as its text. So let's split up that operation:

travel_links <- travel_index %>%
  html_attr('href')

travel_text <- travel_index %>%
  html_text()

# Then recombine them into a dataframe we can use, add some IDs for future sanity and reconstruct the URL, since it's currently a relative path:

travel_index_parsed <- data_frame(text = travel_text, url = travel_links) %>%
  mutate(
    id = row_number(),
    full_url = paste('https://www.tpsgc-pwgsc.gc.ca/', url, sep = '')
  )

# So now we have an index of pages, and we could write a scraper in the future to hit all of them.

# travel_details <- data_frame(date = character(), purpose = character(), total_cost = character(), id = numeric())
#
# # And a function we'll run over the data
#
# scrape_inner_page <- function(row, url) {
#
#   page <- read_html(url) %>%
#     html_nodes('#wb-main-in > table:first-of-type') %>%
#     html_table() %>%
#     as.data.frame()
#
#   if (nrow(page) > 0) {
#     page <- page %>%
#       rename_(
#         date = names(.)[1],
#         purpose = names(.)[2],
#         total_cost = names(.)[3]
#       ) %>%
#       select(date, purpose, total_cost) %>%
#       filter(date != 'TOTAL') %>%
#       mutate(id = row)
#   }
#
#   return(page)
#
# }
#
# for (i in seq(nrow(travel_index_parsed))) {
#   row <- travel_index_parsed[i, 3] %>% pull()
#   url <- travel_index_parsed[i, 4] %>% pull()
#
#   data <- scrape_inner_page(row, url)
#
#   # if (is.list(data)) {
#   #   data <- data[1]
#   # }
#
#   travel_details <- rbind(data, travel_details)
# }
