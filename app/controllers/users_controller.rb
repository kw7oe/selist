class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_authorization 

  def new
    @user = User.new
  end

  def show 
  end

  def create
    puts params[:user]
    if params[:user][:type] == "Student"
      @user = Student.new(user_params)
    elsif params[:user][:type] == "Teacher"
      @user = Teacher.new(user_params)
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_dashboard_path(@user), notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
  end

  def update 

    if @user.update(user_params)
      redirect_to @user
    else 
      render "edit"
    end

  end

  private
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_user
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def check_authorization 
    @user = User.find(params[:id])
    if current_user != @user 
      flash.alert = "Oops, you are not allowed to access the page."
      redirect_back(fallback_location: user_dashboard_path(current_user))
    end
  end

  def invalid_user
    flash.alert = "Invalid user"
    redirect_back(fallback_location: user_dashboard_path(current_user))
  end

  

end
