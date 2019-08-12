class AddImageToFoodItem < ActiveRecord::Migration[5.2]
  def change
  	add_column :food_items, :photo, :string
  end
end
