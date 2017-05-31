class ListsController < ApplicationController
  include UsersHelper
  before_action :set_subject
  before_action :set_list, only: [:edit, :update, :destroy]  
 
  def new
    @list = @subject.lists.build
  end

  def create
    @list = @subject.lists.create(list_params)

    respond_to do |format|

      if @list.save 
        format.html { redirect_to subject_path(@subject), notice: "List created sucessfully" }
        format.js
      else 
        format.html { render "new" }
      end
    end
  end

  def edit 
  end

  def update

    if @list.update(list_params)
      redirect_to subject_path(@subject) 
    else
      render "edit"
    end
  end

  def destroy 
    @list.destroy

    respond_to do |format|
      format.html { redirect_to subject_path(@subject) }
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
    @list = List.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_list
  end

  def list_params
    params.require(:list).permit(:title)
  end


end
