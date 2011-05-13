class Whoops::EventGroup
  # notifier responsible for creating identifier from notice details
  include MongoThing::Document
  self.properties = [:event_type, :service, :environment, :message, :identifier]  
end