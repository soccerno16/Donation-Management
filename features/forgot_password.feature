Feature: Forgot Password
  In order to login when I forgot my password
  As a visitor
  I want to be able to retrieve my password

  @javascript
  Scenario: Send Password
    Given there 1 user with the email address test@domain.com
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
	And my password reset key should expire in 1 hour
	When I open the email
	Then I should see "reset your password" in the email body
	When I follow "reset your password" in the email
	Then I should see "Reset Your Password"
	When I fill in "user[password]" with "testtest"
	And I fill in "user[password_confirmation]" with "testtest"
	And I press "Reset Password"
	Then I should see "Your password has been reset"
	And my password reset key should be set to nil