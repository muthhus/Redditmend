# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_redditmend_session',
  :secret      => 'fc2913a3913b899f62ddb1b22dfb64c4ac8e7ee935c0c81ae0325a3763e1e2ddab92a6a1389cdc57df14cc7f2003df4dfe68972c3251294f10b523bb5d41f571'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
