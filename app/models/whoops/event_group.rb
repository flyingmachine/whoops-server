class Whoops::EventGroup
  # notifier responsible for creating identifier from notice details
  include Mongoid::Document
  include FieldNames
  
  [:service, :environment, :event_type, :message, :identifier].each do |string_field|
    field string_field, :type => String
  end
  field :last_recorded, :type => DateTime
  
  has_many :events, :class_name => "Whoops::Event"
  
  def self.identifying_fields
    field_names - ["message", "last_recorded"]
  end
end