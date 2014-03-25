class CreateAnswerFlows < ActiveRecord::Migration
  def change
    create_table :answer_flows do |t|
      t.integer :parent_id
      t.integer :answer_id
      t.integer :child_id

      t.timestamps
    end
  end
end
