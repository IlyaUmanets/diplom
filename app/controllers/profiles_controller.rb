class ProfilesController < ApplicationController
  before_action :profile

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to :back
  end

  private

  def profile
    @profile = User.find(params[:user_id]).profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :faculty, :course_number)
  end
end
