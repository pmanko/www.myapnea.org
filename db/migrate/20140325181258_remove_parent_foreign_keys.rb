class RemoveParentForeignKeys < ActiveRecord::Migration
  def change
    remove_column :question_flows, :parent_id, :integer
    remove_column :answer_flows, :parent_id, :integer
  end
end
