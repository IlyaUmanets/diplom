class Admin::TestsController < AdminsController
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_dashboards_path
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, questions_attributes: [:body, answers_attributes: [:body, :correct]])
  end
end
