class Whoops::Event
  include MongoThing::Document
  self.properties = [:notification_id, :details, :event_time]
  
  def self.record(params)
    event_group_params = params.except(:event_id, :details, :event_time)

    event_group = Whoops::EventGroup.find_one(event_group_params.except(:message))
    event_group ||= Whoops::EventGroup.create(event_group_params)
  end  
end