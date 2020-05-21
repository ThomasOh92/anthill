class ProjectsController < ApplicationController
  before_action :authenticate_user!

  

  before_action :set_user, only: [:new, :index, :show, :edit, :update, :destroy]

  def index
    if teacher_signed_in?
      @projects = Project.where(teacher_id: @teacher.id)
      @current_user = current_teacher
    else
      @projects = @student.projects
      @current_user = current_student

    end
  end

  def show
    @project = Project.find(params[:id])
    redirect_to project_tasks_path(@project)
  end

  def edit
    if student_signed_in?
      redirect_to projects_path
    else
      @project = Project.find(params[:id])
      @teacher
    end
  end

  def new
    if student_signed_in?
      redirect_to projects_path
    else
      @teacher
      @students = Student.all
    end
  end

  def create
    @project = Project.new(project_params)
    params[:student_ids].each do |id|
      integer_id = id.to_i
      student = Student.find(integer_id)
      @project.students << student
    end  
    @teacher
    result = @project.save

    if result == true
      redirect_to projects_path
    else
      render plain: @project.errors.inspect
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end
  
  private
    def set_user
      if teacher_signed_in?
        @teacher = current_teacher
      else
        @student = current_student
      end
    end

    def project_params
      params.require(:project).permit(:subject, :name, :teacher_id, :student_ids)
    end

    def authenticate_user!
      if teacher_signed_in?
        @current_user = current_teacher
        true
      else
        authenticate_student!
      end
    end
   
end
