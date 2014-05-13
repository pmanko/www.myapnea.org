class AddIpAddressToMailingList < ActiveRecord::Migration
  def change
    add_column :mailing_lists, :ip_address, :string
  end
end
