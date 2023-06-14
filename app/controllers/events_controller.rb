class EventsController < ApplicationController

  def create
    @event = Event.new(event_params)
    @period = Period.find(params[:period_id])
    @event.user = current_user
    @event.period = @period
    if @event.save
      redirect_to markers_path(), notice: "Merci pour votre contibution, votre marqueur est en attente de validation par la communauté"
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
