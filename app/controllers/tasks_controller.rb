class TasksController < ApplicationController
  include ApplicationHelper
  before_action :set_list, :set_subject
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_is_teacher
  def new 
    @task = @list.tasks.build
  end

  def show
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

  def edit 
  end

  def update
    if @task.update(task_params)
      flash.notice = "Task updated successfully"
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy 
    @task.destroy
    respond_to do |format|
      format.html do 
        flash.notice = "Task deleted successfully"
        redirect_to @subject 
      end
      format.js
    end
  end


  private
  def set_subject
    @subject = Subject.find(params[:subject_id])
  rescue ActiveRecord::RecordNotFound
    invalid_model("subject")
  end

  def set_list
    @list = List.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    invalid_model("list")
  end

  def set_task    
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_model("task")
  end

  def task_params
    params.require(:task).permit(:title)
  end

end
