class AnswerSession < ActiveRecord::Base
  belongs_to :question_flow
  belongs_to :answer_node
  belongs_to :user

end
