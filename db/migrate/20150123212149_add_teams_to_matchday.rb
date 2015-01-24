class AddTeamsToMatchday < ActiveRecord::Migration
  def change
    add_column :matchdays, :home_team_id, :integer
    add_column :matchdays, :guest_team_id, :integer
  end
end
