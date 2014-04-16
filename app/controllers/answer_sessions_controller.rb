class AnswerSessionsController < ApplicationController
  before_filter :authenticate_user!
  # Each session needs user(current), question flow

  def start
    # question_flow
    # creates (or finds) answer session
    @question_flow = QuestionFlow.find(params[:question_flow_id])
    @answer_session = AnswerSession.create(user_id: current_user.id, question_flow_id: @question_flow.id)

  end

  def finish
    redirect_to dashboard_path
  end

  def ask_question
    # answer_session (==> question_flow)
    # question
    #

    @answer_session = AnswerSession.find(params[:answer_session_id])
    @question = Question.find(params[:question_id])
  end

  def process_answer
    @question = Question.find(params[:question_id])
    @answer_session = AnswerSession.find(params[:answer_session_id]) # Validate user!

    answer = @answer_session.add_answer(@question, params)

    candidate_edges = QuestionEdge.where(parent_question_id: @question.id, question_flow_id: @answer_session.question_flow.id)

    if candidate_edges.length == 0
      redirect_to dashboard_path
    else
      if candidate_edges.length == 1
        chosen_edge = candidate_edges.first
      else
        chosen_edge = candidate_edges.select {|e| e.condition == answer.value}.first || candidate_edges.select { |e| e.condition == nil }.first || candidate_edges.first
      end


      redirect_to ask_question_path(question_id: chosen_edge.child_question.id, answer_session_id: @answer_session.id)
    end


    #raise StandardError

  end

end