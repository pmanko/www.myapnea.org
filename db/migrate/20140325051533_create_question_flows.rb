class CreateQuestionFlows < ActiveRecord::Migration
  def change
    create_table :question_flows do |t|
      t.string :name
      t.text :description
      t.integer :first_question_id

      t.timestamps
    end
  end
end
