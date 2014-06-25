class SetUpForMailingList < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.tables.include?('mailing_lists')
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
end
