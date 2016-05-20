class Admin::UsersController < AdminsController
  before_action :current_resource

  def update
    render 'dashboards/index' unless @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def current_resource
    @user = User.find(params[:id])
  end
end
