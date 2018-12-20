Feature: Example of how to test template based application

Scenario: Initial application spin up
Given the application is running
When I open the application page
Then I should get a 200 response
