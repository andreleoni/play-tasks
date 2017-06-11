class Api::V0::ProjectsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      response.status = 200
      render json: { project: @project, message: "Projeto criado com sucesso." }
    else
      response.status = 401
      render json: { errors: @project.errors, message: "Ocorreu um erro ao criar o projeto." }
    end
  end

  def update
    if @project.update(project_params)
      response.status = 200
      render json: { project: @project, message: "Projeto atualizado com sucesso." }
    else
      response.status = 401
      render json: { errors: @project.errors, message: "Ocorreu um erro ao atualizar o projeto." }
    end
  end

  def destroy
    if @project.destroy
      render json: { message: "Projeto excluido com sucesso." }
    else
      render json: { message: "Ocorreu um erro ao excluir o projeto." }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])

      if @project.blank?
        response.status = 404
        render json: { message: "Projeto não encotrado." }
      end
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end
end
