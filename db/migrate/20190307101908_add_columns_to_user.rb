class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users,:first_name, :string
  	add_column :users,:last_name, :string
  	add_column :users,:contact_no, :string
  	add_column :users,:address, :text
  end
end
