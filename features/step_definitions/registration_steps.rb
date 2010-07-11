Given /^there are no users with the email address (.*)$/ do |email|
  User.destroy_all
  assert_equal(0,User.count(:all, :conditions => ["email = (?)", email]))
end

Then /^there should be (\d+) user with the email address (.*)$/ do |count, email|
  assert_equal(count,User.count(:all, :conditions => ["email = (?)", email]))
end

Then /^the user with email address (.*) should not be active$/ do |email|
  assert_equal(0,User.count(:all, :conditions => ["email = (?) and active = true", email]))
end
