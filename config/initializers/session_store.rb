# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_something_blue_session',
  :secret      => '7988bd5af8f196362acb532092c4b487262eb26d9edc2ceff84743c6f2179fcc185b62ae5c08c1ba4152c324c34e2e86d3f04e6884ca2c0da61b99c44520f78b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
