class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.string :loc_city
      t.string :loc_country
      t.date :dob
      t.string :profile_pic 
      t.string :gender

      t.timestamps null: false
    end
  end
end
