class PatientController < ApplicationController
  before_filter :authenticate_user!

  layout 'myapnea'

  def dashboard
    @daily_questions = Group.find(2).questions
  end
end
