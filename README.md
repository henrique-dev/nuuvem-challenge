## Nuuvem Chalenge
Is received a text file (tab separated) with data describing the company sales. We need a way for this data to be imported to a database to be analyzed later.

The job is to create a web interface that accepts file uploads, normalizes the data and stores it in a relational database.

The application MUST:

[x] Accept (via HTML form) file uploads of TAB-separated files, with the following columns: purchaser name, item description, item price, purchase count, merchant address, merchant name. You can assume the columns will always be in that order, and that there will always be some value in each column, and that there will always be a header row. An example file called example_input.tab is included on this repo.

[x] Interpret (parse) the received file, normalize the data, and save the data correctly in a relational database. Don't forget to model the entities imported from the file data, considering their relationships.

[x] Show the total gross income represented by the sales data after each file upload, and also the total all-time gross income.

[x] Be written in Ruby 2.5 or greater (or, in the language solicited by the job description, if any).

[x] Have good automated tests coverage.

[x] Be simple to configure and execute, running on a Unix-compatible environment (Linux or macOS).

[x] Use only free / open-source language and libraries.

### Requirements to run:
- docker
- docker-composer

### How to run:
Steps to run the application:
```
docker-compose build
docker-compose run nuuvem rails db:create
docker-compose run nuuvem rails db:migrate
docker-compose run nuuvem rails db:test:prepare
docker-compose up
```
After, the applications must be accessed in the host with the port 8020.

Example:
> http://localhost:8020

To execute the tests, run:
```
docker-compose run nuuvem rspec --format d
```
