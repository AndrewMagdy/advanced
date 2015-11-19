class AddProfileColorToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :profile_color, :integer
  end
end
