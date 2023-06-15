class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :redirection]

  def index
  end

  def redirection
    @periods = Period.all
    @period = @periods.find_by(["DATE(start_date) <= :year and DATE(end_date) >= :year", year: "01/01/#{params[:query]}".to_date])
    if @period
      redirect_to period_path(@period)
    else
      redirect_to request.referer, alert: "Oups, cette date n'est pas encore disponible"
    end
  end


  def show
    @period = Period.find(params[:id])
    @markers = @period.monuments.where("progress >= ?", 10).geocoded.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        marker_html: render_to_string(partial: "monument_marker", locals: { monument: monument })
      }
    end
    @markersevent = @period.events.where("progress >= ?", 10).geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        marker_html: render_to_string(partial: "event_marker", locals: { event: event })
      }
    end
    @personalities = @period.personalities#.where("progress >= ?", 10)
    @polygon = @period.polygons
    @event = Event.new
    @monument = Monument.new
    @personality = Personality.new
  end
end
