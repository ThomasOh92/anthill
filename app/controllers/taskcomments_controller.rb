class TaskcommentsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @taskcomments = Taskcomment.all
    end
  
    def create
    end

    def edit
    end
    
    def update
    end
  
    def destroy
    end
    
    private
  
    def task_params
        params.require(:task).permit(:name, :description, :done)
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
