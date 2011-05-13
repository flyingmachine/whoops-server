class NotificationsController < ApplicationController
  def index
  end
  
  def show
  end
  
  def create
    Notification.create(params[:notification])
  end
end
