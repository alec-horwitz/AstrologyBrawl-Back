class RemoveSpritesFromPokemons < ActiveRecord::Migration[5.1]
  def change
    remove_column :pokemons, :sprites, :string
  end
end
