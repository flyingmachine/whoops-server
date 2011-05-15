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
  
  # @return sorted set of all applicable namespaces
  def self.services
    services = SortedSet.new
    previous_service = []
    all(:sort => [[:service, :asc]]).each do |group|
      services << group.service
      split = group.service.split(".")
      common = (previous_service & split)
      services << common.join(".") unless common.blank?
      previous_service = split
    end
    services
  end
end