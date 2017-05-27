module UsersHelper

  def user_dashboard_path(user)
    path = user
    if user.is_student?
      path = student_path(user)
    else 
      path = teacher_path(user)
    end
    
    return path
  end

end
