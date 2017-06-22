class Api::V0::ApiController < ApplicationController
  def api_methods
    render plain: "
      ### Objects ###
      => Project(id: integer, title: string, description: text)
      => Task(id: integer, content: string, project_id: integer, completed_at: datetime)
      => TimeSheet(id: integer, hours: integer, comment: text, project_id: integer, task_id: integer)
      ###############

      ### Routes ### (All receive and returns a JSON)
      GET    /api/v0/all_tasks

      GET    /api/v0/time_sheets
      POST   /api/v0/time_sheets
      GET    /api/v0/time_sheets/:id
      PUT    /api/v0/time_sheets/:id
      DELETE /api/v0/time_sheets/:id

      PATCH  /api/v0/projects/:project_id/tasks/:id/complete
      GET    /api/v0/projects/:project_id/tasks
      POST   /api/v0/projects/:project_id/tasks
      GET    /api/v0/projects/:project_id/tasks/:id      
      PUT    /api/v0/projects/:project_id/tasks/:id{:format=>:json}
      DELETE /api/v0/projects/:project_id/tasks/:id

      GET    /api/v0/projects
      POST   /api/v0/projects
      GET    /api/v0/projects/:id
      PUT    /api/v0/projects/:id
      DELETE /api/v0/projects/:id   
      ################
    "
  end
end