# Preview all emails at http://localhost:3000/rails/mailers/game_player_mailer
class GamePlayerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/game_player_mailer/invite
  def invite
    game = Game.first!
    player = Player.first!
    GamePlayerMailer.with(game: game, player: player).invite
  end

end
