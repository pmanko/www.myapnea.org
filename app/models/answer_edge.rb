class AnswerEdge < ActiveRecord::Base
  belongs_to :parent_question, class_name: "Answer"
  belongs_to :child_question, class_name: "Answer"
  belongs_to :answer_session
end
