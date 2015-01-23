class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :matchday_id
      t.integer :home_player1_id
      t.integer :home_player2_id
      t.integer :guest_player1_id
      t.integer :guest_player2_id
      t.timestamps null: false
    end
  end
end
