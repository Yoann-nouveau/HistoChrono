class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
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
    @polygon = @period.polygons
  end
end
