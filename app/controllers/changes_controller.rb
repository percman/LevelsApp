class ChangesController<ApplicationController

  def index
    @increase=Student.all.select{|m| m.earn_level == 'Yes'}
    @drop=Student.all.select{|m| m.keep_level == 'No'}
  end
end