class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :playername
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
