ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'vcr'

class ActiveSupport::TestCase
  #VCR configuration
  VCR.configure do |config|
    config.cassette_library_dir = "fixtures/vcr_cassettes"
    config.hook_into :webmock # or :fakeweb
    config.default_cassette_options = { :serialize_with => :json }

    config.before_record do |r|
      r.request.headers.delete("Authorization")
    end
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
