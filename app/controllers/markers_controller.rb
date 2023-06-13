class MarkersController < ApplicationController

  def index
    @user = current_user
    @monuments = Monument.where(user_id: @user.id, progress: (10..))
    @events = Event.where(user_id: @user.id, progress: (10..))
    @personalities = Personality.where(user_id: @user.id, progress: (10..))
    @pending_monuments = Monument.where(user_id: @user.id, progress: (0...10))
    @pending_events = Event.where(user_id: @user.id, progress: (0...10))
    @pending_personalities = Personality.where(user_id: @user.id, progress: (0...10))
  end
end
