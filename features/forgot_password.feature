Feature: Forgot Password
  In order to login when I forgot my password
  As a visitor
  I want to be able to retrieve my password

  @javascript
  Scenario: Send Password
    Given there 1 user with the email address test@domain.com
	And I am on the home page
	When I follow "Login"
	Then I should see "Forgot Password"
	When I follow "Forgot Password"
	Then I should see "Enter your email address"