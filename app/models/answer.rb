class Answer < ActiveRecord::Base
  has_many :answer_values
  belongs_to :question
  belongs_to :answer_session
  has_one :in_edge, class_name: "AnswerEdge", foreign_key: "child_answer_id"
  has_one :out_edge, class_name: "AnswerEdge", foreign_key: "parent_answer_id"

  def value=(val)
    answer_values.build(question.answer_type.data_type => val)
  end

  def value
    answer_values.first[question.answer_type.data_type]
  end
end
