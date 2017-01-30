class TasksController < ApplicationController
	before_action :set_project
	before_action :set_task, except: [:create, :destroy]

	def create		
		@task = @project.tasks.create( task_params )

		redirect_to @project
	end

	def destroy
		@task = @project.tasks.find(params[:id])

		if @task.destroy
			flash[:success] = "Task was deleted successfully."
		else
			flash[:error] = "Task was not be deleted."
		end

		redirect_to @project
	end

	def complete
		if @task.update_attribute(:completed_at, Time.now)
			message = "Task Completed"
		else
			message = "Task could not be Completed"
		end
		redirect_to @project, notice: message
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
