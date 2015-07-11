class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :address
      t.string :status
      t.integer :players_joined
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
