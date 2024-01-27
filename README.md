# README

This README would normally document whatever steps are necessary to get the
application up and running.

=> For this application I have used following design patterns to as part my design
 * RESTful routes to make the API calls
 * Service Objects to encapsulate code
 * Repositiry pattern to encapsulate the logic that retrieves data

=> Functionalities Implemented 
  * I have rswag to write test cases for APIs and generate API docs to test them
  * I have used simplecov to know how much percentage of test cases are covered.
  * I have used Bearer based JWT to authenticate the system
  * I have deployed using render https://test-portfolio-tracker.onrender.com
  * I have implemented CI/CD using .github workflow for CI(continous integration) and 'render' to CD(continous deployment)

Follwing are necessary to setup the application

* ruby "3.2.2"

* rails "7.0"


* postgresql for db

* rswag for api documentation

* simplecov for code coverage

* Clone the github repo

* bundle 

* rails db:create

* rails db:migrate

* rails db:seed

* rails rswag:specs:swaggerize => For documentation

* Authenticate with user credentials at the Authentication block(scroll down the page at https://test-portfolio-tracker.onrender.com/)

* username = example@example.com, password = password these are user credentials. once login collect the Bearer Token and authorize

* Authorize in swagger web on the top right corner to make the api calls.


**UPDATE**

Dated: 27/01/2024 14:15 IST

Dockerized the whole application. 

1) Install Docker and Docker compose
2) docker-compose build
3) docker-compose up


