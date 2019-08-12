class CreateSendMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :send_messages do |t|
    	t.text :message
      t.string :name
      t.string :email
      t.string :subject
      t.timestamps
    end
  end
end
