class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show
    @period = Period.find(param[:id])
    @period.monuments = Munument.all
    @markers = @period.monuments.geocoded.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude
      }
    end
  end
end
