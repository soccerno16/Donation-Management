# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trunk_session',
  :secret      => '0c1a6285890da8d7f4c6a50c3f3d690129f48606384c3c69f7d2bb3ce2c398fda2ac1beba44707ee09a957128bcac72d0206c1c2250e313cbd100d555677de35'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
