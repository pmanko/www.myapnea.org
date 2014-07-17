class AnswersController < ApplicationController
  def add_daily_trend
    current_time = Time.zone.now
    answer_time = Time.zone.local(current_time.year, current_time.month, current_time.day)

    params[:questions].each_pair do |q_id, val|
      #if Answer.where(question_id: q_id, user_id: current_user.id, created_at: answer_time).empty?
      a = Answer.find_or_create_by(question_id: q_id, user_id: current_user.id, created_at: answer_time)
      a.value = val
      a.save
    end

    render nothing: true
  end
end