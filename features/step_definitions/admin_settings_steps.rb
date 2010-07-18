Given /^the site has settings$/ do
   Setting.create(:timezone => "HST", :recaptcha_domain => "domain.com", :recaptcha_public_key => "AAA", :recaptcha_private_key => "BBB")
end
