class CreateQuestionHelp < ActiveRecord::Migration
  def change
    create_table :question_help_messages do |t|
      t.text :message

      t.timestamps
    end
  end
end
