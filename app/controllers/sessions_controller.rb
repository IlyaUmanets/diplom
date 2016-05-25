class SessionsController < ApplicationController
  skip_before_action :require_user

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def session_params
    params[:session]
  end
end
