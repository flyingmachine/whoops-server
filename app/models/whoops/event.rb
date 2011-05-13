class NotificationInstance
  include MongoThing::Document
  self.properties = [:notification_id, :details, :event_time]
end