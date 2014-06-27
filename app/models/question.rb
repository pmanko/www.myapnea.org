class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :answer_type
  belongs_to :unit
  has_many :question_answer_options, -> { order "question_answer_options.created_at" }
  has_many :answer_options, through: :question_answer_options
  has_many :answers
  belongs_to :question_help_message

  include Localizable
  localize :text

  # DAG
  has_dag_links :link_class_name => 'QuestionEdge'

  def next_question(question_flow)
    candidate_edges = QuestionEdge.where(parent_question_id: self[:id], question_flow_id: question_flow.id)
    candidate_edges.first
  end

  def previous_question(question_flow)
    candidate_edges = QuestionEdge.where(child_question_id: self[:id], question_flow_id: question_flow.id)
    candidate_edges.first
  end

  def user_answer(answer_session)
    answers.where(answer_session_id: answer_session.id).first
  end

  def answer_frequencies
    if [3,4].include? question_type.id
      groups = answers.group_by{|answer| answer.show_value}

      #all_options = answer_options.order{|ao| ao.value(answer_type.data_type)}

      all_options = answer_options.to_a.sort_by!{|ao| ao.value(answer_type.data_type)}
      all_options.each do |o|
        groups[o.value(answer_type.data_type)] = []
      end



    elsif question_type.id == 6
      answer_values = answers.map(&:value)
      range = { min: answer_values.min, max: answer_values.max }

      
    end


    groups.inject({}) {|h, (k,v)| h[k] = v.length; h}
  end

  def graph_frequencies
    groups = answers.group_by{|answer| answer.value}
    groups.inject({}) {|h, (k,v)| h[k] = v.length; h}
  end
end
