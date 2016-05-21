class ApplicationController < ActionController::Base
  before_action :require_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private

  def require_user
    redirect_to new_session_path unless current_user
  end
end
