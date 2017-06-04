class Student < User

  def is_student?
    true
  end
  
  def mark_task_done(task_id)
    return TaskStatus.new(user_id: id,task_id: task_id )
  end
end
