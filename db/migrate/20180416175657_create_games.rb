class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.string :winner
      t.string :winner_name
      t.string :winner_health
      t.string :winner_mod
      t.integer :loser_id
      t.string :loser
      t.string :loser_name
      t.string :loser_health
      t.string :loser_mod
      t.string :killing_blow
      t.string :game_mod
      t.string :arena, default: "https://il6.picdn.net/shutterstock/videos/711148/thumb/1.jpg"
      t.string :score
      t.string :mod0
      t.string :mod1
      t.string :mod2
      t.string :mod3
      t.string :mod4
      t.string :mod5
      t.string :mod6
      t.string :mod7
      t.string :mod8
      t.string :mod9
      t.timestamps
    end
  end
end
