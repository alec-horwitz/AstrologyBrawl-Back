class AddMoveTypeToMoves < ActiveRecord::Migration[5.1]
  def change
    add_column :moves, :move_type, :string
  end
end
