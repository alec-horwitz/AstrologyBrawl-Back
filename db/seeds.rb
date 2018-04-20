# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'

# Pokemon.destroy_all
# Move.destroy_all
Game.destroy_all

initial_seed = [*102..151]

initial_seed.each do |index|
  pokemon_parsed = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/#{index}"))
  pokemon = Pokemon.create(name: pokemon_parsed["name"], front_sprite: pokemon_parsed["sprites"]["front_default"], back_sprite: pokemon_parsed["sprites"]["back_default"])
  if pokemon_parsed["types"].size > 1
    pokemon.update(type1: pokemon_parsed["types"][0]["type"]["name"], type2: pokemon_parsed["types"][1]["type"]["name"])
  else
    pokemon.update(type1: pokemon_parsed["types"][0]["type"]["name"])
  end
  moves_to_grab = (pokemon_parsed["moves"].size*0.25).floor
  [*1..moves_to_grab].each do |i|
    move_parsed = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/move/#{pokemon_parsed["moves"][i]["move"]["name"]}"))
    move_parsed["power"] == nil ? power = 0 : power = move_parsed["power"]
    move_parsed["accuracy"] == nil ? accuracy = 0 : accuracy = move_parsed["accuracy"]
    move = Move.create(name: move_parsed["name"], pp: move_parsed["pp"], move_type: move_parsed["type"]["name"], pokemon: pokemon, accuracy: accuracy, power: power)
  end
end

Game.create(playername: "Red", score: 1000)
Game.create(playername: "Blue", score: 2000)
