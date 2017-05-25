class User < ApplicationRecord
	has_and_belongs_to_many :subjects
	has_secure_password
end
