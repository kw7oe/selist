class List < ApplicationRecord
	
  has_many :tasks, dependent: :destroy	
  belongs_to :subject
  
  validates :title, presence: true, uniqueness: { scope: :subject }
  
  def incompleted_tasks(id)
    tasks.select { |task| task.incompleted_task?(id) }
  end
  
end
