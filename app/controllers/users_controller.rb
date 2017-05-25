class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p params
    if params[:type] == "Student"
      @user = Student.new(user_params)
    else
      @user = Teacher.new(user_params)
    end

    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end