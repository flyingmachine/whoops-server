class Notification
  # notifier responsible for creating identifier from notice details
  include MongoThing::Document
  self.properties = [:type, :service, :environment, :message, :identifier]
  
  def self.create_instance(params)
    notification_params = params.except(:notification_id, :details, :event_time)
    
    notification = find_one(notification_params.except(:message))
    notification ||= create(notification_params)
  end
end