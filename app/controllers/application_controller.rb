class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(*)
    period_path(Period.first)
  end
end
