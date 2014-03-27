class RenameTemplate < ActiveRecord::Migration
  def change
    rename_table :templates, :plans
  end
end
