class QuestionsController < ApplicationController
  def self.model_class
    Question
  end

  # Concerns
  include Scaffoldable

  skip_before_filter :verify_authenticity_token, :only => :add_to_research_list


  def frequencies
    @question = Question.find(params[:question_id])
    @answer_session = AnswerSession.find(params[:answer_session_id])
  end

  def add_to_research_list
    #raise StandardError, "ahhh: #{params}" #params[:question_text]

    rl_group = Group.find(1)

    rl_group.questions.create(text_en: params[:question_text])


    @questions = Group.find(1).questions.sort_by{|q| -q.rating }

    respond_to do |format|
      format.js
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def object_params
    params.require(:question).permit(:question_text, :question_type_id, :answer_type_id)
  end

end
