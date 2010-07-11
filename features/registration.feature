Feature: Registration
  In order to use the site
  As a visitor
  I want to be able to create a new account

  @javascript
  Scenario: Successful Signup
    Given there are no users with the email address test@domain.com
	And I am on the home page
	And I am not authenticated
	When I follow "Sign Up"
  	Then I should see "First Name"
	When I fill in the following:
		| user[firstname]             | Brian           |
		| user[lastname]              | McQuay          |
		| user[email]                 | test@domain.com |
		| user[password]              | testtest        |
		| user[password_confirmation] | testtest        |
		| user[url_slug]              | onomojo         |
		| user[gender]                | male            |
		| user[country_id]            | 1               |
		| user[province]              | Santa Cruz      |
	And I select "2005" from "user_birthdate_1i"
	And I select "January" from "user_birthdate_2i"
	And I select "1" from "user_birthdate_3i"
	And I press "Sign up"
	Then I should see "You have signed up successfully"
	And there should be 1 user with the email address test@domain.com
	And the user with email address test@domain.com should not be active

