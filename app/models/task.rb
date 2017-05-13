class Task < ApplicationRecord
	belongs_to :list
	has_many :task_statuses
end
