class PeriodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
    @period = Period.find(param[:id])
  end
end
