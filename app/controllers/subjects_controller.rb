class SubjectsController < ApplicationController
  include UsersHelper
  before_action :set_subject, 
                only: [:show, :edit, :update, 
                       :destroy, :edit_students]  
  def new 
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(subject_params)    
    if @subject.save 
      redirect_to  @subject, notice: "#{@subject.title} created sucessfully"
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
      redirect_to @subject
    else
      render "edit"
    end
  end

  def destroy
    @subject.destroy 

    respond_to do |format|
      format.html { redirect_to user_dashboard_path(current_user) }
      format.js
    end
  end

  def edit_students
  end

  private 
  def set_subject
    @subject = Subject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_subject
  end

  def subject_params
    params.require(:subject).permit(:title, user_ids: [])
  end

  def invalid_subject
    flash.alert = "Invalid user"
    redirect_back user_dashboard_path(current_user)
  end

end
