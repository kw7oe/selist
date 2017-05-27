class ListsController < ApplicationController
  before_action :set_subject, only: [:new, :create]
  def new
    @list = @subject.lists.build
  end

  def create
    @list = @subject.lists.create(list_params)

    if @list.save 
      redirect_to subject_path(@subject), notice: "List created sucessfully"
    else 
      render "new"
    end
  end

  private 
  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

end
