class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :points
      t.integer :game_Id
    end
  end
end
