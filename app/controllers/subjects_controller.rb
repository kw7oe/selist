class SubjectsController < ApplicationController

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
    @subject = Subject.find(params[:id])
    @user = current_user
  end

  private 
  def subject_params
    params.require(:subject).permit(:title)
  end

end
