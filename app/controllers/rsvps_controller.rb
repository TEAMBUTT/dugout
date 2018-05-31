class RsvpsController < ApplicationController
  before_action :set_game
  before_action :set_player
  before_action :set_rsvp

  def show
    if new_status = params[:status]
      case new_status
      when 'going'
        @rsvp.set_status(:going)
      when 'not_going'
        @rsvp.set_status(:not_going)
      else
        raise "invalid status param"
      end
      redirect_to game_rsvp_url(@game)
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_player
    if token = params[:token]
      @player = GlobalID::Locator.locate_signed(token, for: 'rsvp')
      session[:player_id] = @player.id
    elsif player_id = session[:player_id]
      @player = Player.find(player_id)
    else
      head :unauthorized
    end
  end

  def set_rsvp
    @rsvp = Rsvp.new(game: @game, player: @player)
  end
end
