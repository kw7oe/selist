class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      path = user
      if user.is_student?
        path = student_path(user)
      else 
        path = teacher_path(user)
      end
      
      redirect_to path, notice: "Signed in succesfully"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice:"Signed out!"
  end

end
