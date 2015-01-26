class Match < ActiveRecord::Base
  belongs_to :matchday
  has_many :game_sets

  belongs_to :home_player1, class_name: 'Player'
  belongs_to :home_player2, class_name: 'Player'
  belongs_to :guest_player1, class_name: 'Player'
  belongs_to :guest_player2, class_name: 'Player'

  def home_team_name
    [home_player1.name, home_player2.name].join(' & ')
  end

  def guest_team_name
    [guest_player1.name, guest_player2.name].join(' & ')
  end
end
