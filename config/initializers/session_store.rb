# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_connect_session',
  :secret      => '30e07c6c47318560a8d9c9dd71fd1140afabc30ca03b73f725da73cc67ddd81f6eb3f2af23344a4faae805d7b08e83ddd6095b4b87e00ebfbf2f62a3a409eb23'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
