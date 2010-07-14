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
	When I follow "Next"
	Then I should see "Listing Users"
	And I should see "Edit"
	When I follow "edit32"
	Then I should see "Editing user"
	And the "user[firstname]" field should contain "Test"
	And the "user[lastname]" field should contain "Test"
	And the "user[url_slug]" field should contain "test"
	When I fill in the following:
		| user[firstname]       | Test1      |
		| user[lastname]        | Test2      |
		| user[url_slug]        | testtest   |
	And I press "Save"
	Then I should see "User has been successfully updated"
	And I should see "Editing user"
	And the "user[firstname]" field should contain "Test1"
	And the "user[lastname]" field should contain "Test2"
	And the "user[url_slug]" field should contain "testtest"
	And I should see "List Users"