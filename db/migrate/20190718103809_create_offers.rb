class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.integer :status
      t.integer :discount
      t.timestamps
    end
  end
end
