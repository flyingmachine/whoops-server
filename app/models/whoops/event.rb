class Whoops::Event
  include MongoThing::Document
  self.properties = [:event_group_id, :details, :event_time]
  
  def self.record(params)
    event_group_params = params.slice(*Whoops::EventGroup.properties)

    event_group = Whoops::EventGroup.find_one(event_group_params.except(:message))
    event_group ||= Whoops::EventGroup.create(event_group_params)
        
    event_params = params.slice(*Whoops::Event.properties)
    
    create(event_params.merge(:event_group_id => event_group.id.to_s))
  end  
end