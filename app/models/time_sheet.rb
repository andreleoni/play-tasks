class TimeSheet < ApplicationRecord
  belongs_to :project
  belongs_to :task

  validates :project_id, presence: true
end
