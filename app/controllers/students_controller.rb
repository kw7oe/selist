class StudentsController < UsersController
  before_action :set_student
  
  def dashboard
  end

  def done
    @record = @student.mark_task_done(params[:id])
    @record.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: user_dashboard_path(current_user)) }
      format.js
    end
  end

  private
  def set_student    
    @student= Student.find(current_user.id)
  end

end
