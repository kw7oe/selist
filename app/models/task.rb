class Task < ApplicationRecord

  validates :title, presence: true
  
	belongs_to :list
	has_many :task_statuses, dependent: :delete_all

  def incompleted_task?(user_id)
    task_statuses.where(user_id: user_id).blank?
  end

  def incompleted_students_count
    incompleted_students.count
  end

  def incompleted_students
    completed_students_ids = completed_students.map {|student| student.user_id }
    list.subject.students.where.not(id: completed_students_ids)
  end

  def completed_students_count
    TaskStatus.joins(:user).where(task_id: 1).count
  end

  def completed_students
    TaskStatus.joins(:user).where(task_id: 1).select(:user_id, :name)
  end

end
