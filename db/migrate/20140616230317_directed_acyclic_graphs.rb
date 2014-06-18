class DirectedAcyclicGraphs < ActiveRecord::Migration
  def change
    add_column :question_edges, :direct, :boolean
    add_column :question_edges, :count, :integer
    add_column :answer_edges, :direct, :boolean
    add_column :answer_edges, :count, :integer
  end
end


