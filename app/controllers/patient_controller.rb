class PatientController < ApplicationController
  before_filter :authenticate_user!

  layout 'myapnea'

  def dashboard
  end
end
