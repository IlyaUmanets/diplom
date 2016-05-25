class ApplicationController < ActionController::Base
  before_action :require_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    User.find(session[:admin_id]) if session[:admin_id]
  end

  helper_method :current_user

  private

  def require_user
    redirect_to new_session_path unless current_user
  end
end
