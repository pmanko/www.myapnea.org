class AddTimeEstimateToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :time_estimate, :numeric
  end
end
