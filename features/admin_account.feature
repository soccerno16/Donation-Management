Feature: Admin Account
  In order for me to manage my account
  As an admin
  I want to be able to change my login information

  Scenario: Change Information
    Given I am logged in as admin@domain.com
    When I go to the admin dashboard page
	Then I should see "My Account"
	When I follow "My Account"
	Then I should see "Email"
	When I fill in the following:
		| admin[email]                  | test@test.com |
		| admin[password]               | testtest      |
		| admin[password_confirmation]  | testtest      |
	And I press "Save"
	Then I should see "Your account information has been saved"
	And I should see "Logout"
	When I follow "Logout"
	Then I should see "Signed out successfully"
	When I go to the admin dashboard page
	Then I should see "You need to sign in or sign up before continuing"
	When I fill in the following:
		| admin[email]                  | test@test.com |
		| admin[password]               | testtest      |
	And I press "Sign in"
	Then I should see "Signed in successfully"
	And I should see "Admin Dashboard"