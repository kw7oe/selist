class Subject < ApplicationRecord
  default_scope { order(:created_at => :desc) } 
  validates :title, presence: true
  
  has_many :subjects_users
	has_many :users, through: :subjects_users
	has_many :lists, dependent: :destroy
	has_many :resources

  accepts_nested_attributes_for :users

  def students 
    users.where(type: "Student")
  end

  def teacher 
    users.where(type: "Teacher").first
  end

  def tasks
    Task.where(list_id: list_ids)
  end

  def point(user_id)
    TaskStatus.where(user_id: user_id, task_id: tasks).count
  end

  def unhidden_lists
    lists.unhidden
  end

  def hidden_lists
    lists.hidden 
  end

end
