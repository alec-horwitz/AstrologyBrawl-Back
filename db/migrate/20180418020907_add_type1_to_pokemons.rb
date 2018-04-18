class AddType1ToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :type1, :string, :default => ""
  end
end
