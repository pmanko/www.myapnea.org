class PatientController < ApplicationController
  before_filter :authenticate_user!
  def dashboard
    @daily_questions = Group.find(2).questions
  end
end
