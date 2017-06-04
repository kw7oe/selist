class TaskStatus < ApplicationRecord
	belongs_to :user
  belongs_to :task

  validates_uniqueness_of :user_id, :scope => :task_id, :message => "can only have one task" 
end
