class CreateMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power
    end
  end
end
