class UpdateUserModel < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :zip_code, :string
    add_column :users, :accepted_pledge_at, :timestamp
    add_column :users, :accepted_consent_at, :timestamp
  end
end
