require 'spec_helper'

describe Whoops::Event do
  let(:event_params){Whoops::Spec::ATTRIBUTES[:event_params]}
  
  it "should create an EventGroup if one does not already exist" do
    Whoops::Event.record(event_params)
    event_group = Whoops::EventGroup.find_one
    event_group.should_not be_nil
  end
end
