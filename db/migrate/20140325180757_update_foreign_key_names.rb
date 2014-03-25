class UpdateForeignKeyNames < ActiveRecord::Migration
  def change
    rename_column :templates, :origin_id, :question_flow_id
    rename_column :sessions, :origin_id, :answer_flow_id
  end
end
