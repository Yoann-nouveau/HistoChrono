class PersonalitiesController < ApplicationController

  def create
    @period = Period.find(params[:period_id])
    @personality = Personality.new(personalities_params)
    @personality.user = current_user
    @personality.period = @period
    if @personality.save
      redirect_to period_path(@period)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def personalities_params
    params.require(:personality).permit(
      :fullname,
      :birth_day,
      :birth_month,
      :birth_year,
      :death_day,
      :death_month,
      :death_year,
      :deathdate,
      :description,
      :wikipedia_url,
      :photo
    )
  end
end
