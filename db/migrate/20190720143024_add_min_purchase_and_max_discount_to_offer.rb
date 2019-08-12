class AddMinPurchaseAndMaxDiscountToOffer < ActiveRecord::Migration[5.2]
  def change
  	add_column :offers, :min_purchase, :integer
  	add_column :offers, :max_discount, :integer
  end
end
