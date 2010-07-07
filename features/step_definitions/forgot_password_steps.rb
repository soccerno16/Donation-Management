Given /^there (\d+) user with the email address (.*)$/ do |count, email|
  User.count(:all, :conditions => ["email = (?)", email]) == count
end
