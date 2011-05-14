class Whoops::EventGroup
  # notifier responsible for creating identifier from notice details
  include MongoThing::Document
  self.properties = [:event_type, :service, :environment, :message, :identifier, :last_recorded]
  
  def self.identifying_properties
    properties  - [:message, :last_recorded]
  end
end