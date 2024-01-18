
require 'spec_helper'

SimpleCov.start 'rails' do 
  add_filter 'config/'
  add_filter 'spec/'
  add_filter 'test/'

  track_files '{app,lib}/**/*.rb'

  add_group 'Requests', 'spec/requests/**/*.rb'
end

RSpec.configure do |config|
  # In your test helper or configuration file
  config.before(:each, type: :feature) do
    # Disable email sending for feature tests
    allow(Devise::Mailer).to receive(:confirmation_instructions).and_return(double(deliver_now: true))
  end

  config.after(:each, type: :feature) do
    # Clear ActionMailer deliveries after each feature test
    ActionMailer::Base.deliveries.clear
  end
end