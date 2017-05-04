class TeachersController < ApplicationController
   before_action :set_teacher, only: [:show, :edit, :update, :destroy]

    def index
     
       @teachers=Teacher.all.order("name asc")
      if params[:q].present?
    @teachers=Teacher.where("name ilike ?","%#{params[:q]}%" ).order("name asc")
  
  elsif params[:search].present?
    if(params[:sortway]=="Order By Desc")   
    @teachers = Teacher.search(params.require(:search))
  @teachers = @teachers.where("dob>? and dob<?","1960-01-01","1965-12-30").order("dob asc")

    else
     byebug     
    @teachers = Teacher.search(params.require(:search))
  @teachers = @teachers.where("dob>? and dob<?","1960-01-01","1965-12-30").order("dob asc")

    end
end
 # if params.require(:teacher).permit(:start_date).present? and paramsrequire(:teacher).permit(:end_date).present?
 #  byebug
 #  @teachers = @teacher.where("dob>? and dob<?",params[:teacher][:start_date],params[:teacher][:end_date])
 #       end
 
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
   def timeslot_params(name)
    params.require(teacher: :start_date+'ni')
  end
 end
