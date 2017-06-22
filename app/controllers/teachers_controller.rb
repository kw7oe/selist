class TeachersController < UsersController
  include ApplicationHelper
  
  before_action :authenticate_user

  def dashboard
    @teacher= Teacher.find(current_user.id)
  end

end
