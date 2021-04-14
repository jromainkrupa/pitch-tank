module Entrepreneur
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
   
    def new
      @project = Project.new
    end

    def create
      @user    = current_user
      @user.update(is_entrepreneur: true)
      @project = Project.new(project_params)
      @project.user = @user

      if @project.save
        redirect_to entrepreneur_project_path(@project), notice: "Project was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @project.update(project_params)
        redirect_to entrepreneur_project_path(@project), notice: "project was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      redirect_to entrepreneur_projects_url, notice: "project was successfully destroyed."
    end

    def show
    end

    def index
      @projects = Project.where(user: current_user)
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

  end
end