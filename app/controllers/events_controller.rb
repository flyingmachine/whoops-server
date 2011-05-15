class EventsController < ApplicationController
  def index
  end
  
  def show
    @event = Whoops::Event.find(params[:id])
    respond_to do |format|
      format.js { render :partial => 'details', :object => @event, :as => :event}
    end
  end
  
  # TODO break this out into a more metal-y controller
  def create
    Whoops::Event.record(params[:event])
  end
end
