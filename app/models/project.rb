class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
  has_many :time_sheets, dependent: :destroy
end
