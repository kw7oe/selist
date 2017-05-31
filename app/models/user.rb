class User < ApplicationRecord
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, 
                    length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }  
  validates :password, :password_confirmation, 
            presence: true, 
            length: { minimum: 6 },
            on: :create

  has_many :subjects_users
  has_many :subjects, through: :subjects_users
  has_many :task_statuses, dependent: :delete_all
	has_secure_password

  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end

  def is_teacher?
    false
  end

  def is_student?
    false
  end

end
