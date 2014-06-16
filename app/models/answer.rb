class Answer < ActiveRecord::Base
  has_many :answer_values, dependent: :destroy
  belongs_to :question
  belongs_to :answer_session
  has_one :in_edge, class_name: "AnswerEdge", foreign_key: "child_answer_id"
  has_one :out_edge, class_name: "AnswerEdge", foreign_key: "parent_answer_id"


  def self.first_answer(question, answer_session)
    Answer.where(question_id: question.id, answer_session_id: answer_session.id).first
  end

  ## Different options:
  # single value, raw value!
  # single value, answer option id (multiple_choice)
  # Multiple Values, answer option id (check_box)
  # (not supported now) multiple values,

  def value=(val)
    answer_values.clear

    if question.question_type.store_raw_value
      target_field = question.answer_type.data_type
    else
      target_field = 'answer_option_id'
    end

    if question.question_type.allow_multiple and val.type_of?(Array)
      val.each {|v| answer_values.build(target_field => v) }
    else
      answer_values.build(target_field => val)
    end

    if self.persisted?
      self.save
    end

    #answer_values.first.update_attribute(question.answer_type.data_type, val) : answer_values.build(question.answer_type.data_type => val)
  end

  def value(raw = false)
    if question.present? and question.answer_type.present?
      if raw or question.question_type.store_raw_value
        target_field = question.answer_type.data_type
      else
        target_field = 'answer_option_id'
      end

      if question.question_type.allow_multiple and answer_values.length > 1
        answer_values.map{|av| av[target_field] }
      else
        answer_values.first[target_field]
      end
    else
      nil
    end
  end

  def next_answer
    out_edge.child_answer
  end
end
