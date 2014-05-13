class CreateMailingList < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :email,              null: false, default: ""
      t.string :country
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
