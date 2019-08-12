class CreateJoinTableOffersItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :food_items, :offers do |t|
      # t.index [:food_item_id, :offer_id]
      # t.index [:offer_id, :food_item_id]
    end
  end
end
