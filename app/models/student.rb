class Student < User

  def is_student?
    true
  end
  
  def mark_task_done(task_id)
    return TaskStatus.new(user_id: id,task_id: task_id )
  end

  def point 
    TaskStatus.where(user_id: id).count
  end
end
