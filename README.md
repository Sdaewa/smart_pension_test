### Smart pension test
The test is for us to see how you code and the methodologies you use, what we will be looking for in this test are the following:

● Functionality

● Efficiency – We like clean, simple code.

● Readability

● Tests (we have 96% test coverage in our code and we aim to keep it that way).

● Also, we would like to understand your ability to use TDD and OO, so please ensure
these are part of your complete test.

● Feel free to submit your solution as a link to your source control repository

## Test
The test is as follows:

1. Write a program that:

a. Receives a log file as an argument (webserver.log is provided) e.g.: ./parse> webserver.log
b. Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc...
> list of webpages with most unique page views also ordered e.g.:
/about/2 8 unique views /index 5 unique views etc...

## Prerequisites
Make sure you have rspec
$ gem install r_spec

## Running
To run the app:
$ ruby lib/parser.rb

To run the test
& rspec

# Resources
Rubular 