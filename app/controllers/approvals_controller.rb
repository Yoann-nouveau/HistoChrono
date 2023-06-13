class ApprovalsController < ApplicationController
  def index
    @monuments = Monument.where("progress < ?", 10)
    @events = Event.where("progress < ?", 10)
    @personalities = Personality.where("progress < ?", 10)
  end

  def create
  end

  def update
  end
end
