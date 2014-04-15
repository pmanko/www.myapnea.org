class AnswerSession < ActiveRecord::Base
  belongs_to :question_flow
  belongs_to :first_answer, class: "Answer", foreign_key: "first_answer_id"
  belongs_to :user
end
