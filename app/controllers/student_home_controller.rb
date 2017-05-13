class StudentHomeController < ApplicationController
  def index
    @student=Student.find(params[:id])
  end
  def done
    @record=TaskStatus.new
    @record.user_id=params[:userId]
    @record.task_id=params[:taskId]
    @record.save
  end
end
