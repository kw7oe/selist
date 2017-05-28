class SessionsController < ApplicationController
  include UsersHelper
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      puts user.id
      session[:user_id] = user.id     
      redirect_to user_dashboard_path(user), notice: "Signed in succesfully"
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
