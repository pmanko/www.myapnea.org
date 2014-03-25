class AnswerFlow < ActiveRecord::Base
  has_one :session
  belongs_to :answer
  belongs_to :child, class_name: "AnswerFlow", inverse_of: :parent
  has_one :parent, class_name: "AnswerFlow", inverse_of: :child, foreign_key: "child_id"
end
