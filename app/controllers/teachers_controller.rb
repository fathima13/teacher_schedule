class TeachersController < ApplicationController
   before_action :set_teacher, only: [:show, :edit, :update, :destroy]

    def index
      @teachers=Teacher.all
      if params[:q].present?
        @teachers=Teacher.where("name ilike ?","%#{params[:q]}%" ).order("name asc")
      elsif params[:search].present?
        @start_date  = (Date.civil(params[:teacher]["start_date(1i)"].to_i,params[:teacher]["start_date(2i)"].to_i,params[:teacher]["start_date(3i)"].to_i)).strftime("%Y-%m-%d")
        @end_date  = (Date.civil(params[:teacher]["end_date(1i)"].to_i,params[:teacher]["end_date(2i)"].to_i,params[:teacher]["end_date(3i)"].to_i)).strftime("%Y-%m-%d")
        if(params[:sortway]=="Order By Desc")
          @teachers = Teacher.search(params.require(:search)).where("dob>? and dob<?",@start_date,@end_date).order("dob desc")
        else
          params
          @teachers = Teacher.search(params.require(:search)).where("dob>? and dob<?",@start_date,@end_date).order("dob asc")
        end
      end
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
   
 end
