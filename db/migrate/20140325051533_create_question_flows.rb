class CreateQuestionFlows < ActiveRecord::Migration
  def change
    create_table :question_flows do |t|
      t.integer :parent_id
      t.integer :answer_option_id
      t.string :condition
      t.integer :child_id

      t.timestamps
    end
  end
end
