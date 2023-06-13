class ApprovalsController < ApplicationController
  def index
    @monuments = Monument.where("progess < ?", 10)
    @events = Event.where("progess < ?", 10)
    @personalities = Personality.where("progess < ?", 10)
  end

  def create
  end

  def update
  end
end
