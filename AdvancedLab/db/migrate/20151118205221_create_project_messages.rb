class CreateProjectMessages < ActiveRecord::Migration
  def change
    create_table :project_messages do |t|
      t.integer :project_id
      t.integer :sender_id
      t.text :body

      t.timestamps null: false
    end
  end
end
