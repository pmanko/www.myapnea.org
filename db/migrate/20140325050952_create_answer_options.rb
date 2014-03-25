class CreateAnswerOptions < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.decimal :numeric_value
      t.string :text_value
      t.datetime :time_value

      t.timestamps
    end
  end
end
