# Load the Rails application.
require_relative 'application'

#enable active storage as amazon
 config.active_storage.service = :amazon

# Initialize the Rails application.
Rails.application.initialize!
