class QuestionEdge < ActiveRecord::Base
  has_one :question_flow
  belongs_to :parent_question, class_name: "Question"
  belongs_to :child_question, class_name: "Question"
end
