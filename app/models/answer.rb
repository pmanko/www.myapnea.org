class Answer < ActiveRecord::Base
  has_many :answer_values
  belongs_to :question
  has_one :answer_flow


end
