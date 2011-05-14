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
    :event_time => Time.now,
    :details => {
      :line => "32",
      :file => "fail.rb"
    }
  }.merge(to_merge)
end

2.times { Whoops::Event.record(event_params) }
2.times { Whoops::Event.record(event_params(:identifier => "43149"))}
2.times { Whoops::Event.record(event_params(:service => "data_processor.reconciler"))}