class GraphCacheing < ActiveRecord::Migration
  def change
    add_column :question_flows, :tsorted_edges, :text
    add_column :question_flows, :longest_time, :decimal
    add_column :question_flows, :longest_path, :integer
  end
end
