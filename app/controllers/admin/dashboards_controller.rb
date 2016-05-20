class Admin::DashboardsController < AdminsController
  def index
    @users = User.all
  end
end
