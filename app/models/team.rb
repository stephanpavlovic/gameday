class Team < ActiveRecord::Base
  belongs_to :league
  has_many :players
  # has_many :matchdays
  # has_many :matches, through: :matchdays
end
