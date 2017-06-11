class Task < ApplicationRecord
  belongs_to :project, dependent: :destroy
  has_many :time_sheets, dependent: :destroy

  def completed?
  	!completed_at.blank?
  end
end
