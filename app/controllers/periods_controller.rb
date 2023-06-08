class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
    @periods = Period.all
    @period = if params[:query]
      @periods.find_by(["DATE(start_date) <= :year and DATE(end_date) >= :year", year: "01/01/#{params[:query]}".to_date])
    end
    @markers = if @period
      @period.monuments.geocoded.map do |monument|
        {
          lat: monument.latitude,
          lng: monument.longitude,
          marker_html: render_to_string(partial: "monument_marker")
        }
      end
    else
      []
    end
    @markersevent = if @period
      @period.events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          marker_html: render_to_string(partial: "event_marker")
        }
      end
    else
      []
    end
    @personalities = Personality.where(period: @period)
    @polygon = @period ? @period.polygons : []
  end
end
