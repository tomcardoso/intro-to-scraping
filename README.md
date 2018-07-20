# Introduction to scraping

![A version of Gustave Caillebotte's Floor-scapers (Les raboteurs de parquet), 1876](https://upload.wikimedia.org/wikipedia/commons/5/5a/Gustave_Caillebotte-Floor-scrapers_%281876%29.jpg)
_A version of Gustave Caillebotte's Floor-scapers (Les raboteurs de parquet), 1876_

These are resources for a one-day class on the basics of web scraping taught at Wilfrid Laurier University on Friday, July 20th, 2018, as part of the Laurier Summer Institute of Research Methods. Here's a brief description of the course:

> One of the most time-consuming aspects of performing any sort of data analysis is getting that data in the first place. Often, a straightforward, well-structured database doesn't exist, which means you need to build one yourself, from scratch. That's where scraping comes in: you can build a program to automate this collection for you, saving countless hours of boring and imprecise data entry. In this one-day class, you'll learn how to decide on the structure for your data, pick the right scraping approach, create a scraper and systematize your data collection. The class will introduce the basic concepts and strategies behind scraping, and focus on getting data off both websites and offline documents (such as PDFs).

Though this course assumes a basic working knowledge of R, the resources should be straightforward enough that they can be followed by someone with a background in a different programming language, such as JavaScript, Ruby or Python.

### [Part 1: Introduction (9:15am to 9:45am)](/part-1-introduction.html)
  - About me
  - Today's schedule
  - What is scraping?
  - When is it useful? (extracting text, tables, images, bulk downloading files, automating form entry)
  - Types of scraping (manual entry, text pattern matching, using APIs, parsing the DOM, headless browsers)
  - What you will learn

### [Part 2: The basics of markup (9:45am to 10:30am)](part-2-basics-of-markup.html)
  - How web pages work
  - HTML and the DOM, and "view source"
  - Exercise: Let's use View Source and peruse some websites
  - JSON, XML and APIs
  - Chrome Developer Tools
  - _Exercise: Getting familiar with Chrome Developer Tools's Elements, Console and Network tabs_
  - **Additional resources: [https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)**

### 15min break, 10:30am to 10:45am

### [Part 3: Patterns and selections (10:45am to 12pm)](part-3-patterns-and-selections.html)
  - Basic regular expressions
  - _Exercise: Let's write some regular expressions_
  - Selectors and XPath
  - Identifying patterns in markup
  - Writing a basic JavaScript selector query
  - _Exercise: Let's write some queries_
  - **Additional resources: [https://regexone.com/](https://regexone.com/)**

### Lunch break, 12pm to 1:15pm

### [Part 4: Writing your first scraper with rvest (1:15pm to 3pm)](part-4-writing-your-first-scraper.html)
  - Quick tidyverse crash course
  - _Exercise: Using tidyverse packages to read, manipulate, pipe and save data_
  - Connecting to a webpage and extracting information
  - _Exercise: Getting familiar with rvest_
  - Building a scraper to build a scraper
  - Caveats with high-traffic sites, incl. Facebook, Google, Amazon, etc.
  - Throttling your scrape
  - _Exercise: Let's build a throttler_
  - Scrape first, clean later
  - Always err on the side of collecting more data than less
  - Make it reproducible
  - _Exercise: Adapt our scraper to a new website_
  - Advanced scraping with RSelenium
  - **Additional resources: [http://uc-r.github.io/scraping](http://uc-r.github.io/scraping)**
  - **RSelenium: [https://www.r-bloggers.com/scraping-with-selenium/](https://www.r-bloggers.com/scraping-with-selenium/)**

### 15min break, 3pm to 3:15pm

### [Part 5: Offline document scraping (3:15pm to 3:45pm)](part-5-offline-document-scraping.html)
  - Using scrapers to download PDFs and other files
  - Challenges and picking the right tool for the job
  - Tabula and Adobe Acrobat
  - Tesseract, pdfplumber, docs2csv
  - _Exercise: Let's use Tabula to extract tables from a PDF_
  - **Additional resources: [Parsing prickly PDFs](https://github.com/jsfenfen/parsing-prickly-pdfs)**

### Part 6 (time allowing): Let's build a scraper from scratch! (3:45pm to end)
  - Pick a target website and let's write a scraper together
  - _Exercise: Individual scraping_
  - That's it!
