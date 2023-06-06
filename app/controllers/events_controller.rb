class EventsController < ApplicationController

  def new
    @event = Event.new
    @period = Period.find(params[:period_id])
  end
end
