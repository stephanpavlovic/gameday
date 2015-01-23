class Player < ActiveRecord::Base
  belongs_to :team
  has_many :game_sets
  has_many :matches, through: :game_sets
end
