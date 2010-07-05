Feature: Registration
  In order to use the site
  As a visitor
  I want to be able to create a new account

  @javascript
  Scenario: Signup Form
    Given there are no users with the email address test@domain.com
	And I am on the home page
	When I follow "Signup"
    Then I should see "First Name"

  @javascript
  Scenario: Successful Signup
    Given there are no users with the email address test@domain.com
	And I am on the home page
	When I follow "Signup"
  	Then I should see "First Name"
	When I fill in the following:
		| user[firstname]  | Brian           |
		| user[lastname]   | McQuay          |
		| user[email]      | test@domain.com |
		| user[password]   | AAABBB          |
		| user[url_slug]   | onomojo         |
		| user[gender]     | male            |
		| user[birthdate]  | 01/23/1919      |
		| user[country_id] | 1               |
		| user[province]   | Santa Cruz      |
	And I press "Sign Up"
	Then I should see "Signup successful."