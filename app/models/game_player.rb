class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player

  enum status: [ :unknown, :going, :not_going ]
end
