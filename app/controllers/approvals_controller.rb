class ApprovalsController < ApplicationController
  def index
    @monuments = Monument.where("progress < ?", 10).order("created_at DESC")
    @events = Event.where("progress < ?", 10).order("created_at DESC")
    @personalities = Personality.where("progress < ?", 10).order("created_at DESC")
  end

  def create
    marker =
      if params[:monument_id]
        Monument.find(params[:monument_id])
      elsif params[:personality_id]
        Personality.find(params[:personality_id])
      elsif params[:event_id]
        Event.find(params[:event_id])
      end
    @approval = Approval.new
    @approval.user = current_user
    @approval.voteable = marker
    if @approval.save
      if params[:vote_type] == "up"
        marker.progress += 1
        marker.save
        redirect_to approvals_path, notice: "You just vote for this marker !"
      elsif params[:vote_type] == "down"
        marker.progress -= 1
        marker.save
        redirect_to approvals_path, notice: "You just downvote for this marker !"
      end
    else
      render :index
    end
  end

  def update
  end

  def downvote

  end
end
