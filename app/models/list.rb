class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	belongs_to :subject

  def incompleted_tasks(id)
    tasks.select { |task| task.incompleted_task?(id) }
  end
  
end
