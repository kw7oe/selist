class Student < User
  has_many :lists, :through => :subjects
  has_many :tasks, :through => :lists    
  has_many :task_statuses, :through =>:tasks

  def is_student?
    true
  end
  
end
