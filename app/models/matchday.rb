class Matchday < ActiveRecord::Base
  has_many :matches
  belongs_to :league
end
