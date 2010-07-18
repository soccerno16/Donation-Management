Feature: Admin Site-wide Settings
  In order for the site to function properly
  As an admin
  I want to be able to manage all the site-wide settings

  Scenario: Site Settings
    Given I am logged in as test@domain.com
	And the site has settings
    When I go to the admin settings page
	Then I should see "Site Settings"
	When I fill in the following:
		| setting[timezone]              | HST           |
		| setting[recaptcha_domain]      | domain.com    |
		| setting[recaptcha_public_key]  | public_key    |
		| setting[recaptcha_private_key] | private_key   |
	And I press "Save"
	Then I should see "Settings saved"
