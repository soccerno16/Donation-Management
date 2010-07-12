Feature: Forgot Password
  In order to login when I forgot my password
  As a visitor
  I want to be able to retrieve my password

  @javascript
  Scenario: Send Password
    Given there is 1 user with the email address test@domain.com
	And I am on the home page
	When I follow "Login"
	Then I should see "Forgot password?"
	When I follow "Forgot password?"
	Then I should see "Enter your email address"
	And I should see "Home"
	When I fill in "user[email]" with "test@domain.com"
	And I press "Send me reset password instructions"
	Then "test@domain.com" should receive an email with subject "Reset password instructions"
	And I should see "You will receive an email with instructions about how to reset your password in a few minutes"
	And my password reset key should not be nil
	When I open the email
	Then I should see "Change my password" in the email body
	When I follow "Change my password" in the email
	Then I should see "Change your password"
	When I fill in "user[password]" with "testtest"
	And I fill in "user[password_confirmation]" with "testtest"
	And I press "Change my password"
	Then I should see "Your password was changed successfully"
	And my password reset token should be set to nil