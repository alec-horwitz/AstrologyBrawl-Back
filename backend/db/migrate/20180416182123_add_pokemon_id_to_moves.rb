class AddPokemonIdToMoves < ActiveRecord::Migration[5.1]
  def change
    add_column :moves, :pokemon_id, :integer
  end
end
