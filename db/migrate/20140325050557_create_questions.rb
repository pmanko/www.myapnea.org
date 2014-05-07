class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :question_type_id
      t.integer :answer_type_id
      t.integer :unit_id
      t.decimal :time_estimate
      t.string :status

      t.timestamps
    end
  end
end
