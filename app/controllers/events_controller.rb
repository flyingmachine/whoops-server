class EventsController < ApplicationController
  def index
  end
  
  def show
  end
  
  # TODO break this out into a more metal-y controller
  def create
    Whoops::Event.record(params[:event])
  end
end
