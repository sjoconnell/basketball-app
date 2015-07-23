class AddPlayersAllowedToGames < ActiveRecord::Migration
  def change
    add_column :games, :players_allowed, :integer
  end
end
