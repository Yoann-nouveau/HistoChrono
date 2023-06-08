class PersonalitiesController < ApplicationController

  def new
    @personalities = Personality.new
    @period = Period.find(params[:period_id])
  end

  def create
    @period = Period.find(params[:period_id])
    @personalities = Personality.new(personalities_params)
    @personalities.user = current_user
    @personalities.period = @period
    if @personalities.save
      redirect_to periods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def personalities_params
    params.require(:personality).permit(
      :fullname,
      :birthdate,
      :deathdate,
      :description,
      :wikipedia_url
    )
  end
end
