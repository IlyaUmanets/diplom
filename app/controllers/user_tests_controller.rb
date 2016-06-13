class UserTestsController < ApplicationController
  before_action :test, only: [:index, :new]

  def index
    @user_tests = current_user.user_tests.where(test: test)
  end

  def new
    @user_test = @test.user_tests.new
  end

  def create
    user_test = current_user.user_tests.build(user_test_params)
    user_test.update(test_id: params[:test_id])
    redirect_to tests_path
  end

  private

  def test
    @test = Test.find(params[:test_id])
  end

  def user_test_params
    params.require(:user_test).permit(user_results_attributes: [:question_id, :answer_id])
  end
end
