require 'spec_helper'

describe Notification do
  let(:notification_params){
    {
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
  
  it "should create a Notification if one does not already exist" do
    Notification.create_instance(notification_params)
    notification = Notification.find_one
  end

end
