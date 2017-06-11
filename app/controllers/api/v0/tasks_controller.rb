class Api::V0::TasksController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_project, except: [:all_tasks]
	before_action :set_task, except: [:create, :destroy, :all_tasks]

  def index
    render json: @projects.tasks
  end

  def create
		if @project.tasks.create( task_params )
      render json: { task: @task, message: "Tarefa criada com sucesso" }
    else
      response.status = 422
      render json: { errors: @task.errors, message: "Não foi possível criar a tarefa" }
    end

	end

	def destroy
		@task = @project.tasks.find(params[:id])

		if @task.destroy
			render json: "Tarefa excluida com sucesso"
		else
      response.status = 422
			render json: "Ocorreu um erro ao excluir a tarefa"
		end
	end


  def update
    if @task.update(project_params)
      render json: { task: @task, message: "Tarefa atualizada com sucesso" }
    else
      render json: { task: @task.errors, message: "Ocorreu um problema ao atualizar a tarefa" }
    end
  end

	def complete
		if @task.update_attribute(:completed_at, Time.now)
			render json: { task: @task, message: "Tarefa finalizada com sucesso" }
		else
			render json: { task: @task.errors, message: "Ocorreu um erro ao encerrar a tarefa" }
		end
	end

  def all_tasks
    render json: Task.all
  end

	private

	def set_project
		@project = Project.find( params[:project_id] )
	end

	def task_params
		params[:task].permit(:content)
	end

	def set_task
		@task = @project.tasks.find(params[:id])
	end
end
