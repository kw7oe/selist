class SubjectsController < ApplicationController
  include ApplicationHelper
  
  before_action :set_subject, 
                only: [:show, :edit, :update, 
                       :destroy, :edit_students] 
  before_action :authenticate_user
  before_action :check_is_teacher, except: [:show]

  def new 
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(subject_params)    
    if @subject.save 
      redirect_to  @subject, notice: "Subject created sucessfully"
    else
      render "new"
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: "Subject updated successfully"
    else
      render "edit"
    end
  end

  def destroy
    @subject.destroy 

    respond_to do |format|
      format.html do 
        flash.notice = "Subject deleted successfully"
        redirect_to user_dashboard_path(current_user) 
      end
      format.js
    end
  end

  def edit_students
  end

  private 
  def set_subject
    @subject = Subject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_model("subject")
  end

  def subject_params
    params.require(:subject).permit(:title, user_ids: [])
  end

  


end
