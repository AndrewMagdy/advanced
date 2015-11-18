class AddRecepientIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :recepient_id, :integer
  end
end
