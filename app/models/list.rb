class List < ApplicationRecord
	has_many :tasks
	belongs_to :subject

  def incompleted_tasks(id)
    tasks.select { |task| task.incompleted_task?(id) }
  end
  
end
