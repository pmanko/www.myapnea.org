class AnswerSession < ActiveRecord::Base
  belongs_to :question_flow
  belongs_to :first_answer, class_name: "Answer", foreign_key: "first_answer_id"
  belongs_to :last_answer, class_name: "Answer", foreign_key: "last_answer_id"
  belongs_to :user
  has_many :answer_edges

  def self.most_recent(question_flow_id, user_id)
    answer_sessions = AnswerSession.where(question_flow_id: question_flow_id, user_id: user_id).order(updated_at: :desc)
    answer_sessions.empty? ? nil : answer_sessions.first
  end


  def completed_time
    completed_answers.map(&:question).map(&:time_estimate).reduce(:+) || 0
  end

  def remaining_time
    # if last_answer.blank?
    #   s = question_flow.first_question
    # else
    #   s = last_answer.question
    # end
    # # So, we have a last answer, which has a last question. Using that question as a starting point,

    # get distance of all edges

  end
  #
  # def wfs
  #   if last_answer.blank?
  #     s = question_flow.first_question
  #   else
  #     s = last_answer.question
  #   end
  #
  #   edges = QuestionEdge.where(question_flow_id: question_flow.id)
  #
  #
  #
  #   edges.select
  #
  # end
  #
  # def top_sort
  #
  #   qs = []
  #
  #
  #
  #   visited = []
  #
  #
  #
  # end
  #
  # def top_sort_u()
  #
  # end

  def completed_percentage
    (self.completed_time / question_flow.total_time) * 100
  end

  def completed_answers
    Answer.where(answer_session_id: self.id)
  end

  def process_answer(question, params)
    # adding should always be at tail!

    # Create answer object
    # Create answer edge from tail to new answer

    #answer_values =
    answer = Answer.where(question_id: question.id, answer_session_id: self.id).first || Answer.new(question_id: question.id, answer_session_id: self.id)
    answer.value = params[question.id.to_s]
    answer.save


    if self.first_answer_id.blank? or self.last_answer_id.blank?
      self.first_answer_id = answer.id
      self.last_answer_id = answer.id
    else
      answer_edges.create(parent_answer_id: last_answer.id, child_answer_id: answer.id)
      self.last_answer_id = answer.id
    end

    self.save
    #raise StandardError
    answer
  end

  def update_answer
    # WARNING: UPDATING TO A NEW PATH MIGHT REQUIRE RE-ORGANIZATION OF ANSWER FLOW
    # Links between answers might need to be updated. Answers might get orphaned
  end


  def all_answers
    current_answer = first_answer
    answers = []

    begin
      answers << current_answer
      current_answer = current_answer.next_answer
    end while current_answer.present?

    answers
  end
end
