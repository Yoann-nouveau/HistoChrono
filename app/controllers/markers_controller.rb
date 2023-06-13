class MarkersController < ApplicationController

  def index
    @user = current_user
    @monuments = Monument.where(user_id: @user.id)
    @events = Event.where(user_id: @user.id)
    @personalities = Personality.where(user_id: @user.id)
  end
end
