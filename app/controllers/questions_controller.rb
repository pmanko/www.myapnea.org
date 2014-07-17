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

  def daily_trends
    @energy_level = Question.find(20001)
    @sleepiness = Question.find(20003)
    @hours_pap = Question.find(20004)
    @hours_slept = Question.find(20002)

    # temp
    d = {
      sleep:
        [
            {
                key: "Hours Slept",
                bar: true,
                color: "#1E1848",
                values: @hours_slept.answers.where(user_id: current_user).map{|a| [a.created_at.to_i*1000, a.show_value.to_i]}
            },
            {
                key: "Energy Level",
                color: "#F9A61B",
                values: @energy_level.answers.where(user_id: current_user).map{|a| [a.created_at.to_i*1000, a.show_value.to_i]}
            }
        ],
      pap:
        [
            {
                key: "Hours of PAP Use",
                bar: true,
                color: "#1E1848",
                values: @hours_pap.answers.where(user_id: current_user).map{|a| [a.created_at.to_i*1000, a.show_value.to_i]}
            },
            {
                key: "Sleepiness",
                color: "#F9A61B",
                values: @sleepiness.answers.where(user_id: current_user).map{|a| [a.created_at.to_i*1000, a.show_value.to_i]}
            }
        ]

    }

    render json: d

  end

  def add_to_research_list
    #raise StandardError, "ahhh: #{params}" #params[:question_text]

    rl_group = Group.find(1)

    rl_group.questions.create(text_en: params[:question_text])# if current_user.email == "pmankowski@partners.org"


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
