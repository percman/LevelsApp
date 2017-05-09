class LevelsController<ApplicationController
  def index
    @students=Student.order('level, last_name, first_name')
  end
end