json.extract! time_sheet, :id, :hours, :comment, :project_id, :task_id, :created_at, :updated_at
json.url time_sheet_url(time_sheet, format: :json)