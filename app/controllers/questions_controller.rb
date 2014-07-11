class QuestionsController < ApplicationController
  def self.model_class
    Question
  end

  # Concerns
  include Scaffoldable


  def frequencies
    @question = Question.find(params[:question_id])
    @answer_session = AnswerSession.find(params[:answer_session_id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def object_params
    params.require(:question).permit(:question_text, :question_type_id, :answer_type_id)
  end

end
