class AnswerSession < ActiveRecord::Base
  belongs_to :question_flow
  belongs_to :first_answer, class_name: "Answer", foreign_key: "first_answer_id"
  belongs_to :user

  def completed_time


    if AnswerEdge.where(answer_session_id: self.id)

    end

    10
  end

  def completed_percentage
    (self.completed_time / question_flow.total_time) * 100
  end

  def completed_answers

    []
  end
end
