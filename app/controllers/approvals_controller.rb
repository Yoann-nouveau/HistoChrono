class ApprovalsController < ApplicationController
  def index
    @monuments = Monument.where("progress < ?", 10)
    @events = Event.where("progress < ?", 10)
    @personalities = Personality.where("progress < ?", 10)
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
      marker.progress += 1
      marker.save
      redirect_to approvals_path, notice: "You just vote for this marker !"
    else
      render :index
    end
  end

  def update
  end

  def downvote

  end
end
