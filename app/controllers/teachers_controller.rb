class TeachersController < ApplicationController
  
  def dashboard
    @teacher= Teacher.find(params[:id])
  end

end
