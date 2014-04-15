class AnswerSessionsController < ApplicationController
  before_filter :authenticate_user!
  # Each session needs user(current), question flow

  def start
    # question_flow
    # creates (or finds) answer session
    @question_flow = QuestionFlow.find(params[:question_flow_id])
    @answer_session = AnswerSession.find_or_create_by(user_id: current_user.id, question_flow_id: @question_flow.id)

  end

  def ask_question
    # answer_session (==> question_flow)
    # question
    #

    @answer_session = AnswerSession.find(params[:answer_session_id])
    @question = Question.find(params[:question_id])
  end

  def process_answer

  end

end