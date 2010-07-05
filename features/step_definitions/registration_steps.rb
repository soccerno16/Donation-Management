Given /^there are no users with the email address (test@domain\.com)$/ do |email|
  User.count(:all, :conditions => ["email = (?)", email]) == 0
end

Then /^I should see the signup form$/ do
  pending # express the regexp above with the code you wish you had
end
