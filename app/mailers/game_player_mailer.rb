class GamePlayerMailer < ApplicationMailer

  def invite
    @game = params[:game]
    @player = params[:player]

    subject = default_i18n_subject(
      other_team: @game.other_team,
      date: @game.start_time.strftime("%A %B %-d at %I:%M %p")
    )

    mail to: @player.email, subject: subject
  end
end
