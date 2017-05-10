class Subject < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :lists
	has_many :resources
end
