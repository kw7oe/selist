class SubjectController < ApplicationController
    def home
        @subject=Subject.find(params[:id])
        @student=Student.find(params[:userId])
    end
end
