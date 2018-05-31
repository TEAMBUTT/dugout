class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players

  # All players on the team
  def team_players
    Player.all
  end

  # All rsvps (including players who haven't responded)
  def team_rsvps
    team_players.map do |player|
      Rsvp.new(game: self, player: player)
    end
  end
end
