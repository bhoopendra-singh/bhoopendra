class CreateFoodItems < ActiveRecord::Migration[5.2]
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end
end
