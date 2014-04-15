class QuestionFlow < ActiveRecord::Base
  belongs_to :first_question, class: "Question"
end
