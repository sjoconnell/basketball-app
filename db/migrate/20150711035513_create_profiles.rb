class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :height
      t.string :position
      t.string :experience
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
