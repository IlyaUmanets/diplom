class Admin::InvitesController < AdminsController
  def create
    @user = User.new(user_params)
    if @user.save
      InviteMailer.invite(@user, user_params[:password]).deliver_later
      redirect_to admin_dashboards_path, notice: 'User has been successfully invited'
    else
      render :new
    end
  end

  private

  def user_params
    password = SecureRandom.hex(3)
    {
      email: params[:invite][:email],
      password: password,
      password_confirmation: password
    }
  end
end
