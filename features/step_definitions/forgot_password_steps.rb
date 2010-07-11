Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^there (\d+) user with the email address (.*)$/ do |count, email|
  User.create(:email => 'test@domain.com', :birthdate => Time.now, :country_id => 1, :lastname => 'Test', :firstname => 'Test', :gender => 'male', :url_slug => 'test', :password => '')
end


Then /^my password reset key should not be nil$/ do
  assert_equal(1, User.count(:all, :conditions => ["email = 'test@domain.com' and password_reset_key is not null"]))
end

Then /^my password reset key should expire in (\d+) hour$/ do |arg1|
  assert_equal(1,User.count(:all, :conditions => ["email = 'test@domain.com' and password_reset_expires_at > (?) and password_reset_expires_at < (?)", Time.zone.now.to_s(:db), (Time.zone.now + 2.hours).to_s(:db)]))
end

Then /^my password reset key should be set to nil$/ do
  assert_equal(1,User.count(:all, :conditions => ["email = 'test@domain.com' and password_reset_key is null"]))
end
