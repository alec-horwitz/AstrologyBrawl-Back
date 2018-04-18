class ChangePowerToBeIntegerInMoves < ActiveRecord::Migration[5.1]
  def change
    change_column :moves, :power, :integer
  end
end
