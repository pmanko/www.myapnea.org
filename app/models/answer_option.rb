class AnswerOption < ActiveRecord::Base
  has_many :question_answer_options
  has_many :questions, through: :question_answer_options
  has_many :answer_values


  def value(data_type)
    self[data_type.to_sym]
  end
end
