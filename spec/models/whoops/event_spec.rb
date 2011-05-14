require 'spec_helper'

describe Whoops::Event do
  let(:event_params){Whoops::Spec::ATTRIBUTES[:event_params]}
  
  describe ".record" do
    it "should create an EventGroup if one does not already exist" do
      Whoops::Event.record(event_params)
      event_group = Whoops::EventGroup.find_one
      event_group.event_type.should == event_params[:event_type]
      event_group.service.should == event_params[:service]
      event_group.environment.should == event_params[:environment]
      event_group.identifier.should == event_params[:identifier]
      event_group.message.should == event_params[:message]
    end
    
    it "should create an event with event_group_id set to event group id and with details and event time" do
      event = Whoops::Event.record(event_params)      
      event_group = Whoops::EventGroup.find_one

      event.event_group_id.should == event_group.id.to_s
      event.details.to_hash.should == event_params[:details]
      event.event_time.should == event_params[:event_time]
      event.event_time.should == event_group.last_recorded
    end
    
    it "should add an event to an existing event group if group identifier matches" do
      2.times{ Whoops::Event.record(event_params) }
      event_group = Whoops::EventGroup.find_one
      Whoops::Event.find(:event_group_id => event_group.id.to_s).size.should == 2
    end
  end
end