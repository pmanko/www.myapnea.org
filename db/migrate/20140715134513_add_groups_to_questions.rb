class AddGroupsToQuestions < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
    end

    add_column :questions, :group_id, :integer
  end
end
