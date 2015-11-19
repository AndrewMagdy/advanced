class AddPrivacyLevelToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :privacy_level, :integer
  end
end
