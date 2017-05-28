class Task < ApplicationRecord

  validates :title, presence: true
  
	belongs_to :list
	has_many :task_statuses

  def incompleted_task?(id)
    task_statuses.where(user_id: id).blank?
  end

end
