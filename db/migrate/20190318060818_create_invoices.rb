class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :order_id
      t.timestamps
    end
  end
end
