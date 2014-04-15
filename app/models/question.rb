class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :answer_type
  belongs_to :unit
  has_many :question_answer_options
  has_many :answer_options, through: :question_answer_options
  has_many :answers
  has_many :in_edges, class_name: "QuestionEdge", foreign_key: "child_question_id"
  has_many :out_edges, class_name: "QuestionEdge", foreign_key: "parent_question_id"
end
