class TeachersController < UsersController
  
  def dashboard
    @teacher= Teacher.find(params[:id])
  end

end
