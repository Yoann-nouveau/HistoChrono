class MonumentsController < ApplicationController

  def create
    @monument = Monument.new(monument_params)
    @period = Period.find(params[:period_id])
    @monument.user = current_user
    @monument.period = @period
    if @monument.save
      redirect_to markers_path(), notice: "Merci pour votre contibution, votre marqueur est en attente de validation par la communauté"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def monument_params
    params.require(:monument).permit(
      :name,
      :address,
      :description,
      :wikipedia_url,
      :google_earth_url,
      :photo
    )
  end
end
