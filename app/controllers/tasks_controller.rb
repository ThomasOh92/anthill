class TasksController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    @project = Project.find(params[:project_id])
    @task = Task.new
    @tasks = @project.tasks.order("id")
  end

  def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.create(task_params)

      if@task.save
          redirect_to @project
      end
  end
  def edit
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
  end
  
  def update
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id]).update(task_params)

      redirect_to @project
      
  end

  def destroy
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
      @task.destroy

      redirect_to @project
  end
  
  private

  def task_params
      params.require(:task).permit(:name, :description, :done)
  end

end
