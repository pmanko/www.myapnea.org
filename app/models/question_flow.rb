class QuestionFlow < ActiveRecord::Base
  include Localizable
  include TSort

  localize :name
  localize :description

  belongs_to :first_question, class_name: "Question"



  def tsort_each_node(&block)
    all_questions.each(&block)
  end

  def tsort_each_child(node, &block)
    node.children.each(&block)
  end

  def tsorted_edges
    if self[:tsorted_edges].blank?
      update_attribute(:tsorted_edges, tsort.reverse.map(&:id).to_json)
    end

    JSON::parse(self[:tsorted_edges])
  end

  def total_time
    if self[:longest_time].blank?
      update_attribute(:longest_time, find_longest_path(source,leaf)[:time])
    end

    self[:longest_time]
  end

  def total_questions
    if self[:longest_path].blank?
      update_attribute(:longest_path, find_longest_path(source,leaf)[:distance])
    end

    self[:longest_path]
  end


  def find_longest_path(source, destination, by = :time)
    topological_order = tsorted_edges[tsorted_edges.find_index(source.id)..tsorted_edges.find_index(destination.id)]


    distances = Hash[topological_order.map {|q| [q,-1*Float::INFINITY]}]
    times = distances.clone

    times[source.id] = source.time_estimate
    distances[source.id] = 1

    topological_order.each do |question_id|
      question = Question.find(question_id)

      question.children.each do |child|
        if by == :time
          eq_test = (times[child.id].to_f < times[question.id].to_f + child.time_estimate.to_f)
        else
          eq_test = distances[child.id] < distances[question.id] + 1
        end

        if eq_test
          distances[child.id] = distances[question.id] + 1
          times[child.id] = times[question.id] + child.time_estimate.to_d
        end
      end
    end

    {time: times[destination.id].to_f, distance: distances[destination.id]}
  end


  def all_questions
    ([source] + source.descendants)
    #QuestionEdge.where(question_flow_id: self.id).map(&:child_question).uniq + [first_question]
  end

  def source
    first_question
  end

  def leaf
    leaves = first_question.descendants.select {|q| q.leaf?}

    raise StandardError, "Multiple leaves found!" if leaves.length > 1
    raise StandardError, "No leaf found!" if leaves.length == 0

    leaves.first
  end


  def reset_paths
    update_attributes(tsorted_edges: nil, longest_time: nil, longest_path: nil)
  end

  private


end
