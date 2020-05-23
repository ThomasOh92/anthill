class InstructionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @instruction = Instruction.new
    @tasks = @project.tasks.order("id")
    @instructions = @project.instructions.order("id")
  end

  def create
    @project = Project.find(params[:project_id])
    @instruction = @project.instructions.new(instruction_params)
    if @instruction.save
      redirect_to project_instructions_path, notice: 'Instruction was successfully created.'
    else
      redirect_to project_instructions_path, alert: "Unable to add note!"
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @instruction = Instruction.find(params[:id])
  end

  def show
    @project = Project.find(params[:project_id])
    @instructions = @project.instructions.order("id")
  end

  def update
    @project = Project.find(params[:project_id])
    @instruction = @project.instructions.find(params[:id])
    @instruction.update(instruction_params)

    redirect_to project_instructions_path, notice: 'Instruction edited.'
  end

  def destroy
    @project = Project.find(params[:project_id])
    @instruction = @project.instructions.find(params[:id])
    @instruction.destroy
    redirect_to project_instructions_path, notice: "Note deleted!"
  end

  private
    def instruction_params
      params.require(:instruction).permit(:description, :document)
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
