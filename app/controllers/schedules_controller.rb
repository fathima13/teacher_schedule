class SchedulesController < ApplicationController
  def index
   @teacher=Teacher.find(params[:teacher_id])
    @schedules=@teacher.schedules
    @schedule=@schedules.build
  end
  def new
    @teacher=Teacher.find(params[:teacher_id])
    @schedules=@teacher.schedules
    @schedule=@schedules.build
  end
  def create
 	 @teacher=Teacher.find(params[:teacher_id])
    @schedules=@teacher.schedules
    @schedule=@schedules.build
  	@schedule.section=params[:schedule][:section]
  	@schedule.semester=params[:schedule][:semester]
  	@schedule.branch=params[:schedule][:branch]
    @schedule.day=params[:schedule][:day]
    @schedule.time=params[:schedule][:time] 
    @schedule.teacher_id=params[:schedule][:teacher_id]
  	if @schedule.save
      flash[:message] = "slot scheduled"
    else
      flash[:message] = "slot is not scheduled. Same day and time already exist"
    end
  	redirect_to teacher_schedules_url(teacher_id:@teacher)
  end
  def edit
     @teacher=Teacher.find(params[:teacher_id])
     @schedules=@teacher.schedules
    @schedule=@schedules.find(params[:id])
    
  end
  def update
  	 @teacher=Teacher.find(params[:teacher_id])
     @schedules=@teacher.schedules
    @schedule=@schedules.find(params[:id])
  	@schedule.section=params[:schedule][:section]
  	@schedule.semester=params[:schedule][:semester]
  	@schedule.branch=params[:schedule][:branch]
    @schedule.day=params[:schedule][:day]
  	@schedule.time=params[:schedule][:time]
  	@schedule.save
  	redirect_to teacher_schedules_url
  end
  def show
     @teacher=Teacher.find(params[:teacher_id])
     @schedules=@teacher.schedules
    @schedule=@schedules.find(params[:id])
  end
  def destroy
    @teacher=Teacher.find(params[:teacher_id])
    @schedules=@teacher.schedules
    @schedule=@schedules.find(params[:id])
    @schedule.destroy
    redirect_to teacher_schedules_url    
  end
end
