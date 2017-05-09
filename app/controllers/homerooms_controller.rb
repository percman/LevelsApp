class HomeroomsController < ApplicationController
  before_action :set_homeroom, only: [:show, :edit, :update, :destroy]

  # GET /homerooms
  # GET /homerooms.json
  def index
    @homerooms = Homeroom.order('name')
  end

  # GET /homerooms/1
  # GET /homerooms/1.json
  def show
  end

  # GET /homerooms/new
  def new
    @homeroom = Homeroom.new
  end

  # GET /homerooms/1/edit
  def edit
  end

  # POST /homerooms
  # POST /homerooms.json
  def create
    @homeroom = Homeroom.new(homeroom_params)

    respond_to do |format|
      if @homeroom.save
        format.html { redirect_to @homeroom, notice: 'Homeroom was successfully created.' }
        format.json { render :show, status: :created, location: @homeroom }
      else
        format.html { render :new }
        format.json { render json: @homeroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homerooms/1
  # PATCH/PUT /homerooms/1.json
  def update
    respond_to do |format|
      if @homeroom.update(homeroom_params)
        format.html { redirect_to @homeroom, notice: 'Homeroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @homeroom }
      else
        format.html { render :edit }
        format.json { render json: @homeroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homerooms/1
  # DELETE /homerooms/1.json
  def destroy
    @homeroom.destroy
    respond_to do |format|
      format.html { redirect_to homerooms_url, notice: 'Homeroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homeroom
      @homeroom = Homeroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white levels through.
    def homeroom_params
      params.require(:homeroom).permit(:name)
    end
end
