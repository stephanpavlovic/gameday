class Team < ActiveRecord::Base
  belongs_to :league
  has_many :players
  has_many :match_days
  has_many :matches, through: :matchdays
end
