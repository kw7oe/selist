class TasksController < ApplicationController
  before_action :set_list, :set_subject

  def new 
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.create(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @subject, notice: "Task added sucessfully" }
        format.js
      else
        format.html { render "new" }
      end
    end
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
  end


  private
  def set_subject
    @subject = Subject.find(params[:subject_id])
  rescue ActiveRecord::RecordNotFound
    invalid_subject
  end

  def set_list
    @list = List.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    invalid_list
  end

  def task_params
    params.require(:task).permit(:title)
  end

end
