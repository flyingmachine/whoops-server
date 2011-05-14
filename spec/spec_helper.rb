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
    
  config.before(:each) do
    Mongoid::Config.master.collections.select{|c| c.name !~ /^system\./}.each(&:remove)
  end
  
  config.after :suite do
    Mongoid::Config.master.collections.select{|c| c.name !~ /^system\./}.each(&:remove)
  end
end

module Whoops
  module Spec
    ATTRIBUTES = {
      :event_params => {
        :event_type => "error",
        :service => "test.service",
        :environment => "production",
        :message => "ArgumentError",
        :identifier => "3r42",
        :event_time => Time.now.to_s,
        :details => {
          :line => "32",
          :file => "fail.rb"
        }
      }
    }
  end
end