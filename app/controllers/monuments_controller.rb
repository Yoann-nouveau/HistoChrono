class MonumentsController < ApplicationController

  def new
    @monument = Monument.new
    @period = Period.find(params[:period_id])
  end

  def create
    @monument = Monument.new(monument_params)
    @period = Period.find(params[:period_id])
    @monument.user = current_user
    @monument.period = @period
    if @monument.save
      redirect_to period_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def monument_params
    params.require(:monument).permit(
      :name,
      :location,
      :description,
      :wikipedia_url,
      :google_earth_url
    )
  end
end
