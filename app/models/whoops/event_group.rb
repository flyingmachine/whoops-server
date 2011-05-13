class Whoops::EventGroup
  # notifier responsible for creating identifier from notice details
  include MongoThing::Document
  self.properties = [:type, :service, :environment, :message, :identifier]  
end