# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'faker'

def event_params(to_merge = {})
  {
    :event_type => "error",
    :service => "data_processor",
    :environment => "production",
    :message => "ArgumentError: " + Faker::Name.first_name,
    :identifier => "3r42",
    :event_time => rand(100000).seconds.ago,
    :details => {
      :line => "32",
      :file => "fail.rb",
      :environment => {
        :host => Faker::Internet.domain_name,
        :port => "80"
      },
      :backtrace => [
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `require'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:227:in `load_dependency'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `require'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:346:in `require_or_load'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:300:in `depend_on'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:216:in `require_dependency'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/abstract_controller/helpers.rb:148:in `modules_for_helpers'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/abstract_controller/helpers.rb:144:in `map!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/abstract_controller/helpers.rb:144:in `modules_for_helpers'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/action_controller/metal/helpers.rb:101:in `modules_for_helpers'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/abstract_controller/helpers.rb:97:in `helper'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/actionpack-3.0.7/lib/action_controller/base.rb:228:in `inherited'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/barista-0.6.1/app/controllers/barista_controller.rb:1",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `require'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `require'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:227:in `load_dependency'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `require'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:346:in `require_or_load'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:300:in `depend_on'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:216:in `require_dependency'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/engine.rb:138:in `eager_load!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/engine.rb:137:in `each'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/engine.rb:137:in `eager_load!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/engine.rb:135:in `each'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/engine.rb:135:in `eager_load!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/activesupport-3.0.7/lib/active_support/dependencies.rb:239:in `to_proc'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application/railties.rb:11:in `each'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application/railties.rb:11:in `all'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application.rb:107:in `eager_load!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application/finisher.rb:41",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/initializable.rb:25:in `instance_exec'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/initializable.rb:25:in `run'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/initializable.rb:50:in `run_initializers'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/initializable.rb:49:in `each'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/initializable.rb:49:in `run_initializers'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application.rb:134:in `initialize!'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application.rb:77:in `send'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/railties-3.0.7/lib/rails/application.rb:77:in `method_missing'",
        "/web_sites/whoops/config/environment.rb:5",
        "/web_sites/whoops/spec/spec_helper.rb:3:in `require'",
        "/web_sites/whoops/spec/spec_helper.rb:3",
        "/web_sites/whoops/spec/controllers/event_groups_controller_spec.rb:1:in `require'",
        "/web_sites/whoops/spec/controllers/event_groups_controller_spec.rb:1",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/configuration.rb:412:in `load'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/configuration.rb:412:in `load_spec_files'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/configuration.rb:412:in `map'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/configuration.rb:412:in `load_spec_files'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/command_line.rb:18:in `run'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/runner.rb:80:in `run_in_process'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/runner.rb:69:in `run'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/gems/rspec-core-2.6.0/lib/rspec/core/runner.rb:11:in `autorun'",
        "/.rvm/gems/ree-1.8.7-2010.02@whoops/bin/rspec:19"
      ]
    }
  }.merge(to_merge)
end
def create_events(to_merge = {})
  srand
  rand(50).times{ Whoops::Event.record(event_params(to_merge)) }
end

create_events
create_events(:identifier => "43149", :message => "Connection Refused")
create_events(:service => "data_processor.reconciler")
create_events(:identifier => "109ca", :message => "FileException", :service => "app.web")
create_events(:identifier => "824b3", :service => "app.background")
create_events(:identifier => "2222", :service => "data_processor.cache", :message => "Warming cache", :event_type => "notification")
