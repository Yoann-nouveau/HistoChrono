class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def redirection
    @periods = Period.all
    @period = @periods.find_by(["DATE(start_date) <= :year and DATE(end_date) >= :year", year: "01/01/#{params[:query]}".to_date])
    if @period
      redirect_to period_path(@period)
    else
      redirect_to request.referer, alert: "cette date n'est pas encore présente"
    end
  end


  def show
    @period = Period.find(params[:id])
    @markers = @period.monuments.geocoded.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        marker_html: render_to_string(partial: "monument_marker")
      }
    end
    @markersevent = @period.events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        marker_html: render_to_string(partial: "event_marker")
      }
    end
    @personalities = Personality.where(period: @period)
    @polygon = @period.polygons
  end
end
