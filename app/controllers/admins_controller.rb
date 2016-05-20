class AdminsController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    redirect_to new_admin_session if current_user&.user? # TODO: It's wrong, we should redirect to root of users page
  end
end
