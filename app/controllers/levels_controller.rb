class LevelsController<ApplicationController
  def index
    @students=Student.order('level')
  end
end