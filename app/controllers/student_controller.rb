class StudentController < ApplicationController
  
  def home
    @student= Student.find(params[:id])
  end

  def done
    @user= User.find(params[:userId])
    @task= @user.tasks.find(params[:taskId])
    @record = @task.task_statuses.build
    @record.user_id = params[:userId]
    @record.task_id = params[:taskId]
    @record.save
  end
end
