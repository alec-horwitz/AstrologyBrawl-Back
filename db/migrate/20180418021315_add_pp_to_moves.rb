class AddPpToMoves < ActiveRecord::Migration[5.1]
  def change
    add_column :moves, :pp, :integer
  end
end
