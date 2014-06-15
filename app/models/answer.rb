class Answer < ActiveRecord::Base
  has_many :answer_values, dependent: :destroy
  belongs_to :question
  belongs_to :answer_session
  has_one :in_edge, class_name: "AnswerEdge", foreign_key: "child_answer_id"
  has_one :out_edge, class_name: "AnswerEdge", foreign_key: "parent_answer_id"


  def self.first_answer(question, answer_session)
    Answer.where(question_id: question.id, answer_session_id: answer_session.id).first
  end

  def value=(val)
    answer_values.length == 1 ? answer_values.first.update_attribute(question.answer_type.data_type, val) : answer_values.build(question.answer_type.data_type => val)
  end

  def values=(vals)
    if answer_values.present?
      answer_values.clear
    end

    if self.persisted?
      vals.each {|value| answer_values.create(answer_option_id: value)}
    else
      vals.each {|value| answer_values.build(answer_option_id: value)}
    end
  end

  def values

  end

  def value
    if question.present? and question.answer_type.present?
      
      answer_values.first[question.answer_type.data_type]
    else
      nil
    end
  end

  def next_answer
    out_edge.child_answer
  end


end
