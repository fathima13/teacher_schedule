class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.search index_params
  end
  
  def new
  	@teacher=Teacher.new
  end

  def create
  	@teacher=Teacher.new(teacher_params)
  	@teacher.save
    redirect_to teachers_url
  end

  def edit
  end

  def update
     @teacher.update(teacher_params)
     @teacher.save
     redirect_to teachers_url
   end
  
  def show
  end
  
  def destroy
   @teacher.destroy
   redirect_to teachers_url
  end
 
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :gender, :dob)
  end

  def index_params
    params.permit(:q, :start_date, :end_date, :order_by_field, :order_by)
  end

end
