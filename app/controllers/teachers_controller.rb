class TeachersController < UsersController
  include ApplicationHelper
  
  before_action :authenticate_user

  def dashboard
    @teacher= Teacher.find(params[:id])
  end

end
