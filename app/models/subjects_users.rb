class Subjects_Users < ApplicationRecord
	has_many :users
	has_many :subjects
end
