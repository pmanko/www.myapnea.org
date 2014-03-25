class QuestionFlow < ActiveRecord::Base
  has_many :templates
  belongs_to :answer_option
  belongs_to :child, class_name: "QuestionFlow", inverse_of: :parent
  has_one :parent, class_name: "QuestionFlow", inverse_of: :child, foreign_key: "child_id"


end
