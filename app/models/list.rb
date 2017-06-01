class List < ApplicationRecord
  
  validates :title, presence: true, uniqueness: { scope: :subject }

  has_many :tasks, dependent: :destroy  
  belongs_to :subject

  scope :unhidden, -> { where(is_hidden: false) }
  scope :hidden, -> { where(is_hidden: true) }

  def incompleted_tasks(id)
    tasks.select { |task| task.incompleted_task?(id) }
  end
  
end
