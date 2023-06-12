class EventsController < ApplicationController

  def new
    @event = Event.new
    @period = Period.find(params[:period_id])
  end

  def create
    @event = Event.new(event_params)
    @period = Period.find(params[:period_id])
    @event.user = current_user
    @event.period = @period
    if @event.save
      redirect_to period_path(@period)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :start_day,
      :start_month,
      :start_year,
      :end_day,
      :end_month,
      :end_year,
      :address,
      :description,
      :wikipedia_url,
      :youtube_url,
      :photo
    )
  end
end
