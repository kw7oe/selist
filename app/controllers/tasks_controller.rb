class TasksController < ApplicationController
  before_action :set_list, :set_subject

  def new 
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.create(task_params)

    if @task.save
      redirect_to @subject, notice: "Task added sucessfully"
    else
      render "new"
    end
  end


  private
  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end

end
