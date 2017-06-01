class Subject < ApplicationRecord

  validates :title, presence: true
  
  has_many :subjects_users
	has_many :users, through: :subjects_users
	has_many :lists, dependent: :destroy
	has_many :resources

  accepts_nested_attributes_for :users

  def tasks
    lists.flatten_map { |list| list.tasks  }
  end

  def unhidden_lists
    lists.unhidden
  end

  def hidden_lists
    lists.hidden 
  end

end
