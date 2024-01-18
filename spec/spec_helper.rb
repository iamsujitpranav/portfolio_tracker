require 'factory_bot_rails'
require 'simplecov'
SimpleCov.start

Rails.env = "test"

require File.expand_path('../config/environment', __dir__)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# RspecApiDocumentation.configure do |config|
#   config.swagger_format = :json
#   config.curl_host = 'http://localhost:3000' # Set your API host
# end


