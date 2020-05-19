class ProjectsController < ApplicationController
  before_action :set_teacher, only: [:index, :show, :edit, :update, :destroy]

  def index
    @projects = Project.where(teacher_id: @teacher.id)
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_teacher
    @teacher = current_teacher
  end
end
