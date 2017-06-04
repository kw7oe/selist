class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def check_is_teacher 
    if current_user.is_student?
      flash.alert = "Oops, you are not allowed to access the page."
      redirect_back(fallback_location: user_dashboard_path(current_user))
    end
  end

  helper_method :current_user
end
