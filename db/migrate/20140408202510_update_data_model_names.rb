class UpdateDataModelNames < ActiveRecord::Migration
  def change
    rename_table :question_flows, :question_nodes
    rename_table :answer_flows, :answer_nodes
    rename_table :plans, :question_flows
    rename_table :sessions, :answer_sessions

    rename_column :question_flows, :question_flow_id, :question_node_id
    rename_column :answer_sessions, :answer_flow_id, :answer_node_id
    rename_column :answer_sessions, :template_id, :question_flow_id
  end
end
