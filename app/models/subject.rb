class Subject < ApplicationRecord

  validates :title, presence: true
  
	has_and_belongs_to_many :users
	has_many :lists, dependent: :destroy
	has_many :resources

  accepts_nested_attributes_for :users

  def tasks
    lists.flatten_map { |list| list.tasks  }
  end

end
