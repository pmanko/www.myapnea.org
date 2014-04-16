class AnswerSession < ActiveRecord::Base
  belongs_to :question_flow
  belongs_to :first_answer, class_name: "Answer", foreign_key: "first_answer_id"
  belongs_to :user

  def completed_time
    completed_answers.map(&:question).map(&:time_estimate).reduce(:+) || 0
  end

  def completed_percentage
    (self.completed_time / question_flow.total_time) * 100
  end

  def completed_answers
    Answer.where(answer_session_id: self.id)

  end

  def add_answer(question, params)
    # adding should always be at tail!

    # Create answer object
    # Create answer edge from tail to new answer

    #answer_values =
    answer = Answer.new(question_id: question.id, answer_session_id: self.id)
    answer.value = params[question.id.to_s]
    answer.save
    answer
  end

  def update_answer
    # WARNING: UPDATING TO A NEW PATH MIGHT REQUIRE RE-ORGANIZATION OF ANSWER FLOW
    # Links between answers might need to be updated. Answers might get orphaned
  end


end
