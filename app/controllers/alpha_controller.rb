class AlphaController < ApplicationController
  def index
    @students=Student.order('last_name, first_name')
  end
end