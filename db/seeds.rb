# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def event_params(to_merge = {})
  {
    :event_type => "error",
    :service => "data_processor",
    :environment => "production",
    :message => "ArgumentError",
    :identifier => "3r42",
    :event_time => rand(100000).seconds.ago,
    :details => {
      :line => "32",
      :file => "fail.rb"
    }
  }.merge(to_merge)
end
def create_events(to_merge = {})
  srand
  (rand(3) + 1).times{ Whoops::Event.record(event_params(to_merge)) }
end

create_events
create_events(:identifier => "43149", :message => "Connection Refused")
create_events(:service => "data_processor.reconciler")
create_events(:identifier => "109ca", :message => "FileException", :service => "app.web")
create_events(:identifier => "824b3", :service => "app.background")
