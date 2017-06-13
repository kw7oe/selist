class List < ApplicationRecord
  
  validates :title, presence: true, uniqueness: { scope: :subject }

  has_many :tasks, dependent: :destroy  
  belongs_to :subject

  scope :unhidden, -> { where(is_hidden: false) }
  scope :hidden, -> { where(is_hidden: true) }

  def incompleted_tasks(user_id)
    tasks.select { |task| task.incompleted_task?(user_id) }
  end

  def completed_tasks(user_id)
    tasks.select { |task| !task.incompleted_task?(user_id) }
  end
  
end
