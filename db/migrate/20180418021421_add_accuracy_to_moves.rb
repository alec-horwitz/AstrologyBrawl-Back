class AddAccuracyToMoves < ActiveRecord::Migration[5.1]
  def change
    add_column :moves, :accuracy, :integer
  end
end
