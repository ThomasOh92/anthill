class TasksController < ApplicationController
  # before_action :authenticate_user!
   
  def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.create(task_params)

      if@task.save
          redirect_to @project
      end
  end
  def edit
      @project = Project.find(params[:project_id])
      @task = task.find(params[:id])
  end
  
  def update
      @project = Project.find(params[:project_id])
      @task = task.find(params[:id]).update(task_params)

      redirect_to @project
      
  end

  def destroy
      @project = Project.find(params[:project_id])
      @task = task.find(params[:id])
      @comment.destroy

      redirect_to @project
  end
  
  private

  def task_params
      params.require(:task).permit(:name, :description, :done)
  end

end
