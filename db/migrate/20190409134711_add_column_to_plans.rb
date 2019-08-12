class AddColumnToPlans < ActiveRecord::Migration[5.2]
  def change
  	add_column :plans, :no_of_days, :integer
  end
end
