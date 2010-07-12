Feature: Admin Users
  In order to manage the site
  As an admin
  I want to be able to manage all users

  @javascript
  Scenario: Listing Users
    Given I am logged in as test@domain.com
    And there are 40 users
	And I am on the home page
	When I go to the admin users page
	Then I should see "Listing Users"
	And I should see "test9@domain.com"
	And I should see "Next"
