class CreateGamePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_players do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :player, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
