class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @material = Material.new
    @tasks = @project.tasks.order("id")
    @materials = @project.materials.order("id")
  end

  def create
    @project = Project.find(params[:project_id])
    @material = @project.materials.new(material_params)
    if @material.save
      redirect_to project_materials_path, notice: 'Material uploaded.'
    else
      # redirect_to project_materials_path, notice: 'Material upload failed.'
      redirect_to project_materials_path, notice: @material.errors.messages[:photo].split(', ').join(' ')
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @material = Material.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])
    @material.update(material_params)

    redirect_to project_materials_path, notice: 'Material edited.'
  end

  def destroy
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])
    @material.destroy
    redirect_to project_materials_path, notice: "Note deleted!"
  end

  private
    def material_params
      params.require(:material).permit(:title, :project_id, :photo)
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