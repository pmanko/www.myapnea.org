class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :template_id
      t.integer :origin_id

      t.timestamps
    end
  end
end
