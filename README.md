# Introduction to scraping

![A version of Gustave Caillebotte's Floor-scapers (Les raboteurs de parquet), 1876](https://upload.wikimedia.org/wikipedia/commons/5/5a/Gustave_Caillebotte-Floor-scrapers_%281876%29.jpg)

These are resources for a one-day class on the basics of web scraping taught at Wilfrid Laurier University on Friday, July 20th, 2018, as part of the Laurier Summer Institute of Research Methods. Here's a brief description of the course:

> One of the most time-consuming aspects of performing any sort of data analysis is getting that data in the first place. Often, a straightforward, well-structured database doesn't exist, which means you need to build one yourself, from scratch. That's where scraping comes in: you can build a program to automate this collection for you, saving countless hours of boring and imprecise data entry. In this one-day class, you'll learn how to decide on the structure for your data, pick the right scraping approach, create a scraper and systematize your data collection. The class will introduce the basic concepts and strategies behind scraping, and focus on getting data off both websites and offline documents (such as PDFs).

Though this course assumes a basic working knowledge of R, the resources should be straightforward enough that they can be followed by someone with a background in a different programming language, such as JavaScript, Ruby or Python.

### Part 1: Introduction
  - What is scraping?
  - When is it useful? (extracting text, tables, images, bulk downloading files, etc.)
  - Types of scraping (manual entry, text pattern matching, using APIs, parsing the DOM)
  - What you will learn

### Part 2: The basics of markup
  - How web pages work
  - HTML and the DOM, and "view source"
  - JSON, XML and APIs
  - Chrome Developer Tools

### Part 3: Patterns and selections
  - Selectors and XPath
  - Basic regular expressions
  - Identifying patterns in markup
  - Writing a basic JavaScript selector query

### Part 4: Writing your first scraper with rvest
  - Connecting to a webpage and extracting information
  - Throttling your scrape
  - Building a scraper to build a scraper

### Part 5: Offline document scraping
  - Challenges
  - Tabula
  - Tesseract, pdfplumber, docs2csv
  - [Parsing prickly PDFs](https://github.com/jsfenfen/parsing-prickly-pdfs)

### Part 6: Let's build a scraper from scratch!
  - Pick a target website and let's write a scraper together
  - Individual scraping work
