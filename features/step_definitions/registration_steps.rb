Given /^there are no users with the email address (.*)$/ do |email|
  User.count(:all, :conditions => ["email = (?)", email]) == 0
end

Then /^there should be (\d+) user with the email address (.*)$/ do |count, email|
  User.count(:all, :conditions => ["email = (?)", email]) == count
end

Then /^the user with email address (.*) should not be active$/ do |email|
  User.count(:all, :conditions => ["email = (?) and active = true", email]) == 0
end
