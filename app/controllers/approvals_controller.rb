class ApprovalsController < ApplicationController
  def index
    get_all_markers
  end

  def create
    marker = set_marker
    @approval = Approval.new
    @approval.user = current_user
    @approval.voteable = marker
    if @approval.save
      if params[:vote_type] == "up"
        marker.progress += 1
        marker.save
        redirect_to approvals_path, notice: "Merci pour votre vote positif !"
      elsif params[:vote_type] == "down"
        marker.progress -= 1
        marker.save
        redirect_to approvals_path, notice: "Merci pour vottre contribution à la communauté !"
      end
    else
      get_all_markers
      render :index
    end
  end

  def set_marker
    if params[:monument_id]
      Monument.find(params[:monument_id])
    elsif params[:personality_id]
      Personality.find(params[:personality_id])
    elsif params[:event_id]
      Event.find(params[:event_id])
    end
  end

  private

  def get_all_markers
    @monuments = Monument.to_approve.order_by_creation.not_approved_by(current_user)
    @events = Event.to_approve.order_by_creation.not_approved_by(current_user)
    @personalities = Personality.to_approve.order_by_creation.not_approved_by(current_user)
  end
end
