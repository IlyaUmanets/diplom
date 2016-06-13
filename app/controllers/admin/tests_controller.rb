class Admin::TestsController < AdminsController
  before_action :test, only: [:edit, :update]

  def index
    @tests = current_admin.tests.order(created_at: :asc)
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    @test.update(test_params)
    redirect_to admin_tests_path
  end

  def create
    @test = current_admin.tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  private

  def test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:name, questions_attributes: [:body, answers_attributes: [:body, :correct]])
  end
end
