class SubjectsController < ApplicationController
  include UsersHelper
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  
  def new 
    @subject = Subject.new
  end

  def create
    @subject = current_user.subjects.create(subject_params)    
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
      redirect_to user_dashboard_path(current_user)
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

  private 
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:title, lists_attributes: [:title])
  end

end
