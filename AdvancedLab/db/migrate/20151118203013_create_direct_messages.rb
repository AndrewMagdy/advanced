class CreateDirectMessages < ActiveRecord::Migration
  def change
    create_table :direct_messages do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.text :body

      t.timestamps null: false
    end
  end
end
