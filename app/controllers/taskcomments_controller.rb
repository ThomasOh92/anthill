class TaskcommentsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @project = Project.find(params[:project_id])
      @taskcomment = Taskcomment.new      
      @taskcomments = Taskcomment.all.order("task_id").select do |taskcomment|
         @project.tasks.include?(taskcomment.task) 
      end       
    end
  
    def create
      Taskcomment.create(taskcomment_params)
      redirect_to project_tasks_path
    end

    def edit
      redirect_to project_tasks_path
    end
    
    def update
      Taskcomment.find(params[:id]).update(taskcomment_params)
      redirect_to project_tasks_path
    end
  
    def destroy
      @project = Project.find(params[:project_id])
      Taskcomment.find(params[:id]).destroy
      redirect_to project_tasks_path
    end
    
    private
  
    def taskcomment_params
        params.require(:taskcomment).permit(:task_id, :comment)
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
