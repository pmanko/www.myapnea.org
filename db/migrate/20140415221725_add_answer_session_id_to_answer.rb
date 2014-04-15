class AddAnswerSessionIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :answer_session_id, :integer
  end
end
