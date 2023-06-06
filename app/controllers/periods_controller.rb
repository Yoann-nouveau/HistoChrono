class PeriodsController < ApplicationController
  def index
  end

  def show
    @period = Period.find(param[:id])
  end
end
