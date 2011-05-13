# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :mocha
  
  config.before :suite do
    connect_to_test_database
  end
  
  config.after(:each) do
    MongoThing.db.collections.each(&:remove)
  end
  
  config.after :suite do
    MongoThing.drop_non_system_collections
  end
end

# This is probably a very naive way to do this
def connect_to_test_database
  config = File.read(File.join(File.dirname(__FILE__), '../config/mongo.yml'))
  settings = YAML.load(ERB.new(config).result)
  MongoThing.connection = settings[:test] unless MongoThing.connection
end


module Whoops
  module Spec
    ATTRIBUTES = {
      :event_params => {
        :type => "error",
        :service => "test.service",
        :environment => "production",
        :message => "ArgumentError",
        :identifier => "3r42",
        :details => {
          :line => "32",
          :file => "fail.rb"
        }
      }
    }
  end
end