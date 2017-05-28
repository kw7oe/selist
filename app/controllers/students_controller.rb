class StudentsController < ApplicationController
  
  def dashboard
    @student= Student.find(params[:id])
  end

  def done
    @record = TaskStatus.new
    @record.user_id = current_user.id
    @record.task_id = params[:id]
    @record.save

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
  end

end
