class AdminsController < ApplicationController
  skip_before_action :require_user
  before_action :require_admin

  private

  def require_admin
    redirect_to new_admin_session_path unless current_admin&.admin? # TODO: It's wrong, we should redirect to root of users page
  end
end
