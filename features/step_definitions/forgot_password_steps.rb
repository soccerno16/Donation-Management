Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^there is (\d+) user with the email address (.*)$/ do |count, email|
  User.create(:email => 'test@domain.com', :birthdate => Time.now, :country_id => 1, :lastname => 'Test', :firstname => 'Test', :gender => 'male', :url_slug => 'test', :password => 'testtest')
end


Then /^my password reset key should not be nil$/ do
  assert_equal(1, User.count(:all, :conditions => ["email = 'test@domain.com' and reset_password_token is not null"]))
end

Then /^my password reset token should be set to nil$/ do
  assert_equal(1,User.count(:all, :conditions => ["email = 'test@domain.com' and reset_password_token is null"]))
end
