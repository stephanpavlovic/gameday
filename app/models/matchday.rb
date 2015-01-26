# encoding: utf-8

class Matchday < ActiveRecord::Base
  has_many :matches
  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
  belongs_to :league

  def teams
    [home_team, guest_team].compact
  end

  def generate_games(home_player_ids, guest_player_ids, games = 10)
    home_id_collection = home_player_ids
    guest_id_collection = guest_player_ids
    p "Basis: #{home_player_ids}"
    games.times do
      match = self.matches.new
      #HOME TEAM
      if home_id_collection.size >= 2
        home_team = home_id_collection.sample(2) # 2 zufällige Spieler
        home_id_collection -= home_team # Restliche Spieler - aktuelle Spieler
      elsif home_id_collection.size == 1
        home_team = home_id_collection # letzter Spieler gesetzt
        new_player = (home_player_ids - home_team).sample # aus restlichen Spielern den 2. Spieler bestimmen
        home_team += [new_player]
        home_id_collection = home_player_ids - [new_player]
      else
        home_id_collection = home_player_ids
        home_team = home_id_collection.sample(2) # 2 zufällige Spieler
        home_id_collection -= home_team # Restliche Spieler - aktuelle Spieler
      end
      match.home_player1_id = home_team.first
      match.home_player2_id = home_team.last
      #GUEST TEAM
      if guest_id_collection.size >= 2
        guest_team = guest_id_collection.sample(2) # 2 zufällige Spieler
        guest_id_collection -= guest_team # Restliche Spieler - aktuelle Spieler
      elsif guest_id_collection.size == 1
        guest_team = guest_id_collection # letzter Spieler gesetzt
        new_player = (guest_player_ids - guest_team).sample # aus restlichen Spielern den 2. Spieler bestimmen
        guest_team += [new_player]
        guest_id_collection = guest_player_ids - [new_player]
      else
        guest_id_collection = guest_player_ids
        guest_team = guest_id_collection.sample(2) # 2 zufällige Spieler
        guest_id_collection -= guest_team # Restliche Spieler - aktuelle Spieler
      end
      match.guest_player1_id = guest_team.first
      match.guest_player2_id = guest_team.last

      p match.save

      # guest_player1_id: guest_team.first,
      # guest_player2_id: guest_team.last
    end
  end
end
