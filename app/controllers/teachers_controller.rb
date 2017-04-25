class TeachersController < ApplicationController
  def index
  	@teachers=Teacher.all
  end
  def new
  	@teacher=Teacher.new
  end
   def create
  	@teacher=Teacher.new
  	@teacher.name = params[:teacher][:name]
  	@teacher.save
    redirect_to teachers_url
  end
  def edit
  	@teacher=Teacher.find(params[:id])
  end
  def update
  	@teacher = Teacher.find(params[:id])
  	@teacher.name = params[:teacher][:name]
  	@teacher.save
  	redirect_to teachers_url
  end
   def show
  	@teacher = Teacher.find(params[:id])
  end
   def destroy
  	@teacher = Teacher.find(params[:id])
  	@teacher.destroy
  	redirect_to teachers_url
  end
end
