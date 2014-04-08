class QuestionNode < ActiveRecord::Base
  has_many :question_flows
  belongs_to :answer_option
  belongs_to :child, class_name: "QuestionNode", inverse_of: :parent
  has_one :parent, class_name: "QuestionNode", inverse_of: :child, foreign_key: "child_id"


end
