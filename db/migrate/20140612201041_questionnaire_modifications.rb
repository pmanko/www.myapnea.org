class QuestionnaireModifications < ActiveRecord::Migration
  def change
    add_column :questions, :old_id, :integer
  end
end
