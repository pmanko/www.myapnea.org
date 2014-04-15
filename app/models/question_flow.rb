class QuestionFlow < ActiveRecord::Base
  belongs_to :first_question, class_name: "Question"
end
