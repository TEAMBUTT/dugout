class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :start_time
      t.string :other_team
      t.string :location
      t.string :location_map_url

      t.timestamps
    end
  end
end
