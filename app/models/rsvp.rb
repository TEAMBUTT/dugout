class Rsvp
  attr_reader :game, :player

  def initialize(game:, player:)
    @game = game
    @player = player
  end

  STATUS_STRINGS = {
    going: "Going",
    not_going: "Not going",
    unknown: "Maybe"
  }

  def game_player
    @game_player ||=
      game.game_players.where(player: player).first_or_initialize
  end

  def set_status(new_status)
    game_player.update!(status: new_status)
  end

  def status
    game_player.status.to_sym
  end

  def status_string
    STATUS_STRINGS[status]
  end
end
