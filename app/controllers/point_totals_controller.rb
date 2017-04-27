class PointTotalsController < ApplicationController
  before_action :set_point_total, only: [:show, :edit, :update, :destroy]

  # GET /point_totals
  # GET /point_totals.json
  def index
    @student=Student.find(params[:student_id])
    @point_totals = @student.point_totals.order("date DESC")
    @parent_point = current_user.student.point_totals.order("date DESC")
  end

  # GET /point_totals/1
  # GET /point_totals/1.json
  def show
    @student=Student.find(params[:student_id])
    @point_total = @student.point_totals.find(params[:id])
  end

  # GET /point_totals/new
  def new
    @student=Student.find(params[:student_id])
    @point_total = @student.point_totals.build
  end

  # GET /point_totals/1/edit
  def edit
    @student=Student.find(params[:student_id])
    @point_total = @student.point_totals.find(params[:id])
  end

  # POST /point_totals
  # POST /point_totals.json
  def create
    @student=Student.find(params[:student_id])
    @point_total = @student.point_totals.new(point_total_params)

    respond_to do |format|
      if @point_total.save
        format.html { redirect_to student_point_total_path(@student, @point_total), notice: 'Point total was successfully created.' }
        format.json { render :show, status: :created, location: @point_total }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_totals/1
  # PATCH/PUT /point_totals/1.json
  def update

    @student=Student.find(params[:student_id])
    @point_total = @student.point_totals.find(params[:id])

    respond_to do |format|
      if @point_total.update(point_total_params)
        format.html { redirect_to student_point_total_path(@student, @point_total), notice: 'Point total was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_total }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_totals/1
  # DELETE /point_totals/1.json
  def destroy
    @point_total.destroy
    respond_to do |format|
      format.html { redirect_to student_point_totals_url, notice: 'Point total was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_total
      @point_total = PointTotal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_total_params
      params.require(:point_total).permit(:student_id, :date, :score, :absent)
    end
end
