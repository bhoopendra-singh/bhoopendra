class ChangeColumnTypeToplan < ActiveRecord::Migration[5.2]
  def change
  	change_column :plans, :stripe_plan_id, :string
  end
end
