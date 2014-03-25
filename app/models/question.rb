class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :answer_type
  has_many :question_answer_options
  has_many :answer_options, through: :question_answer_options
  has_many :answers
end
