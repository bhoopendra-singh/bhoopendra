class AddColumnStatusToCartItem < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_items, :status, :integer
  end
end
