class Whoops::EventGroup
  # notifier responsible for creating identifier from notice details
  include Mongoid::Document
  [:event_type, :service, :environment, :message, :identifier].each do |string_field|
    field string_field, :type => String
  end
  field :last_recorded, :type => DateTime
  has_many :events, :class_name => "Whoops::Event"
  
  def self.field_names
    self.fields.keys
  end
  
  def self.identifying_fields
    field_names  - ["message", "last_recorded"]
  end
end