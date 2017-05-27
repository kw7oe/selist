class StudentsController < ApplicationController
  
  def show
    @student= Student.find(params[:id])
  end
  
  def done
    @record = TaskStatus.new
    @record.user_id = params[:user_id]
    @record.task_id = params[:task_id]
    @record.save
  end

end
