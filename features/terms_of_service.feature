Feature: Terms of Service Page
  In order to see the terms of service
  As a visitor
  I want to be able to view the terms of service

  Scenario: Access terms of service
    Given I am on the home page
	When I follow "Terms of Service"
	Then I should see "These are the terms"

  Scenario: Back to homepage
	Given I am on the terms of service page
	When I follow "Home"
	Then I should be on the home page