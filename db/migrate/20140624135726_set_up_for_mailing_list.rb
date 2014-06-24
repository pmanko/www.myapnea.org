class SetUpForMailingList < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :email,              null: false, default: ""
      t.string :country
      t.string :state
      t.string :zip_code
      t.string :ip_address
      t.timestamps
    end
  end
end
