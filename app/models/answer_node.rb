class AnswerNode < ActiveRecord::Base
  has_one :answer_session
  belongs_to :answer
  belongs_to :child, class_name: "AnswerNode", inverse_of: :parent
  has_one :parent, class_name: "AnswerNode", inverse_of: :child, foreign_key: "child_id"
end
