class AddAnswerSessionIdToAnswerEdge < ActiveRecord::Migration
  def change
    add_column :answer_edges, :answer_session_id, :integer
  end
end
