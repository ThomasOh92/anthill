class ProjectsController < ApplicationController
  before_action :set_teacher, only: [:new, :index, :show, :edit, :update, :destroy]

  def index
    @projects = Project.where(teacher_id: @teacher.id)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @teacher
  end

  def new
    @teacher
  end

  def create
    @project = Project.new(project_params)
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
    def set_teacher
      @teacher = current_teacher
    end

    def project_params
      params.require(:project).permit(:subject, :name, :teacher_id)
    end
end
