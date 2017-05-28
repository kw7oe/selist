class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

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
      redirect_to root_url, notice: "Thank you for signing up!"
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
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
