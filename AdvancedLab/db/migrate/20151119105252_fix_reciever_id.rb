class FixRecieverId < ActiveRecord::Migration
  def change
    rename_column :direct_messages, :reciever_id, :receiver_id
  end
end
