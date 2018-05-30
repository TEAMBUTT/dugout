require 'test_helper'

class GamePlayerMailerTest < ActionMailer::TestCase
  test "invite" do
    game = games(:one)
    player = players(:jared)

    mail = GamePlayerMailer.with(game: game, player: player).invite
    assert_equal "vs. The Bad Guys on Saturday May 19 at 04:15 PM", mail.subject
    assert_equal ["jared@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
