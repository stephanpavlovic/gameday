  class CreateMatchdays < ActiveRecord::Migration
  def change
    create_table :matchdays do |t|
      t.date :date
      t.timestamps null: false
    end
  end
end
