class Matchday < ActiveRecord::Base
  has_many :matches
  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
  belongs_to :league

  def teams
    [home_team, guest_team].compact
  end
end
