class Admin::SessionsController < AdminsController
  skip_before_action :require_admin

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to admin_dashboards_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
  end

  private

  def session_params
    params[:session]
  end
end
