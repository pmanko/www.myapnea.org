class AnswerSessionsController < ApplicationController
  before_filter :authenticate_user!
  # Each session needs user(current), question flow

  def start
    # question_flow
    # creates (or finds) answer session
    @question_flow = QuestionFlow.find(params[:question_flow_id])
    @answer_session = AnswerSession.find_or_create_by(user_id: current_user.id, question_flow_id: @question_flow.id)
    @answer_session.reset_answers
  end

  def finish
    @answer_session = AnswerSession.find(params[:answer_session_id])
    @question_flow = @answer_session.question_flow
  end

  def ask_question
    # answer_session (==> question_flow)
    # question
    #

    @answer_session = AnswerSession.find(params[:answer_session_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.where(question_id: @question.id, answer_session_id: @answer_session.id).first || Answer.new(question_id: @question.id, answer_session_id: @answer_session.id)

    #@previous_path = @answer_session.last_answer.present? ? ask_question_path(question_id: @answer_session.last_answer.question.id, answer_session_id: @answer_session.id) : ''
    #@disabled = @answer_session.last_answer.blank?

    #raise StandardError

  end

  def process_answer
    @question = Question.find(params[:question_id])
    @answer_session = AnswerSession.find(params[:answer_session_id]) # Validate user!

    answer = @answer_session.process_answer(@question, params)

    if answer.next_question.nil?
      MY_LOG.info "EXITING"
      redirect_to finished_answer_session_path(@answer_session)
    else
      MY_LOG.info "#{answer.next_question.id}"
      redirect_to ask_question_path(question_id: answer.next_question.id, answer_session_id: @answer_session.id)
    end
  end
end