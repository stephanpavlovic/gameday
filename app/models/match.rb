class Match < ActiveRecord::Base
  belongs_to :matchday
  has_many :game_sets
end
