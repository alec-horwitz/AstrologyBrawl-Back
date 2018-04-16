class AddBackSpriteToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :back_sprite, :string
  end
end
