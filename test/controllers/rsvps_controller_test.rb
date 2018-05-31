require 'test_helper'

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
    @player = players(:adam)
  end

  test "should get show without token" do
    get game_rsvp_url(@game)
    assert_response :unauthorized
  end

  test "should get show with token" do
    get game_rsvp_url(@game, token: @player.to_sgid(for: 'rsvp'))
    assert_response :success

    # Token should be saved in the session
    get game_rsvp_url(@game)
    assert_response :success
  end

  test "should get show with token and status" do
    assert :unknown, Rsvp.new(game: @game, player: @player).status
    get game_rsvp_url(@game, token: @player.to_sgid(for: 'rsvp'), status: 'going')

    assert_redirected_to game_rsvp_url(@game)
    assert :going, Rsvp.new(game: @game, player: @player).status
  end
end
