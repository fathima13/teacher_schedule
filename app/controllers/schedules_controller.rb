class SchedulesController < ApplicationController
  def index
  	@schedules=Schedule.all
  end
  def new
  	@schedule=Schedule.new
  end
  def create
  	@schedule=Schedule.new
  	@schedule.section=params[:schedule][:section]
  	@schedule.semester=params[:schedule][:semester]
  	@schedule.branch=params[:schedule][:branch]
    @schedule.day=params[:schedule][:day]
    @schedule.time=params[:schedule][:time]  
  	@schedule.save
  	redirect_to schedules_url
  end
  def edit
    @schedule=Schedule.find(params[:id])
  end
  def update
  	@schedule=Schedule.find(params[:id])
  	@schedule.section=params[:schedule][:section]
  	@schedule.semester=params[:schedule][:semester]
  	@schedule.branch=params[:schedule][:branch]
    @schedule.day=params[:schedule][:day]
  	@schedule.time=params[:schedule][:time]
  	@schedule.save
  	redirect_to schedules_url
  end
end
