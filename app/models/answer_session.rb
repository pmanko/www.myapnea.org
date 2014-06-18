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


  def calculate_status_stats
    completed = completed_path
    remaining = remaining_path

    {
        percent_completed: (completed[:time] / (completed[:time] + remaining[:time])) * 100,
        completed_questions: completed[:distance],
        remaining_questions: remaining[:distance],
        total_questions: completed[:distance] + remaining[:distance],
        completed_time: completed[:time],
        remaining_time: remaining[:time],
        total_time: completed[:time] + remaining[:time]
    }
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
  # def remaining_answers
  #   if last_answer.blank?
  #     s = question_flow.first_question
  #   else
  #     s = last_answer.question
  #   end
  #
  #   # # So, we have a last answer, which has a last question. Using that question as a starting point,
  #   l = question_flow.leaf
  #
  #   question_flow.find_longest_path(s,l)[:distance]
  #
  # end

  def completed_answers
    if first_answer
      Answer.joins(:in_edge).where(answer_session_id: self.id).select{|a| a.in_edge.present? }.append(first_answer)
    else
      []
    end
  end

  def completed?
    remaining_path[:distance] == 0

  end

  def process_answer(question, params)
    # adding should always be at tail!

    # Create answer object
    # Create answer edge from tail to new answer

    #answer_values =
    answer = Answer.where(question_id: question.id, answer_session_id: self.id).first || Answer.new(question_id: question.id, answer_session_id: self.id)


    if answer.new_record? or answer.string_value != params[question.id.to_s] or answer.in_edge.blank?
      answer.value = params[question.id.to_s]
      answer.save


      if self.first_answer_id.blank?
        self.first_answer_id = answer.id
      else
        if answer.in_edge.blank? and answer != first_answer
          answer_edges.create(parent_answer_id: last_answer.id, child_answer_id: answer.id)
        else
          answer.destroy_descendant_edges #
        end
      end

      self.last_answer_id = answer.id
      self.save
    end

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

  private

  def completed_path
    time = completed_answers.map(&:question).map(&:time_estimate).reduce(:+) || 0.0
    distance = completed_answers.length

    {time: time, distance: distance}
  end

  def remaining_path

    if last_answer.blank?
      {time: question_flow.total_time, distance: question_flow.total_questions}
    else
      s = last_answer.next_question

      if s
        # # So, we have a last answer, which has a last question. Using that question as a starting point,
        l = question_flow.leaf

        result = question_flow.find_longest_path(s,l)
  #      corrections = {time: (last_answer ? last_answer.question.time_estimate : 0), distance: 1}
        corrections = {time: 0.0, distance: 0}

        {time: result[:time] - corrections[:time], distance: result[:distance] - corrections[:distance]}
      else
        {time: 0.0, distance: 0}
      end
    end
  end

end
