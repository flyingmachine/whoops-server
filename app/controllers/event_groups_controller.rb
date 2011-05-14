class EventGroupsController < ApplicationController
  def index
    @event_groups = Whoops::EventGroup.all
  end
end
