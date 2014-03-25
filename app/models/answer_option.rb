class AnswerOption < ActiveRecord::Base
  has_many :question_answer_options
  has_many :questions, through: :question_answer_options
  has_many :answer_values
end
