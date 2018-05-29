json.extract! game, :id, :start_time, :other_team, :location, :location_map_url, :created_at, :updated_at
json.url game_url(game, format: :json)
