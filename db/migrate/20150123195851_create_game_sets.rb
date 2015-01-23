class CreateGameSets < ActiveRecord::Migration
  def change
    create_table :game_sets do |t|
      t.integer :match_id
      t.integer :score_home
      t.integer :score_guest
      t.timestamps null: false
    end
  end
end
