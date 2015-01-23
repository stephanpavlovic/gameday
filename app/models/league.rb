class League < ActiveRecord::Base
  has_many :matchdays
  has_many :teams
end
