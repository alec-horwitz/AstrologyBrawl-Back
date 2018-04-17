class AddFrontSpriteToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :front_sprite, :string
  end
end
