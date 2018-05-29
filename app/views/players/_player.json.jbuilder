json.extract! player, :id, :name, :email, :created_at, :updated_at
json.url player_url(player, format: :json)
