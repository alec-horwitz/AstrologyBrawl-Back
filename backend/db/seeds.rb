# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'

Pokemon.destroy_all
Move.destroy_all

initial_seed = [*1..10]

initial_seed.each do |index|
  pokemon_parsed = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/#{index}"))
  pokemon = Pokemon.create(name: pokemon_parsed["name"], sprites: pokemon_parsed["sprites"])
    [*1..2].each do |i|
      move_parsed = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/move/#{i}"))
      move = Move.create(name: move_parsed["name"], power: move_parsed["power"], pokemon: pokemon)
    end
end
