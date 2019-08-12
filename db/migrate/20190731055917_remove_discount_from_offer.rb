class RemoveDiscountFromOffer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :offers, :discount, :integer
  end
end
