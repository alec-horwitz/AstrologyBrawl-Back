# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'


stockAvatars = AVATARS

stockMain = 15
stockAttack = 5
stockDefence = 5
types = ["earth", "air", "fire", "water"]
stockUsernames = ["Moxareck", "AstroMonkey77", "ProfaneFontaine", "GreenRanger19", "CyberCat<(^.^<)", "Alec", "No.3037","64BitRick","Leo-E","test","HellGaze451","RedGhost11"]

index = 0
SIGNS.each { |sign, avatar|
  User.create(name: stockUsernames[index], password: "test", avatar: SIGNS[sign][:avatar], main: stockMain, attack: stockAttack, defence: stockDefence, type1: SIGNS[sign][:type], type2: types[Random.rand(0...4)], type3: types[Random.rand(0...4)])
  index = index + 1
}

User.all.each { |user|
  Random.rand(1...6).times do
    Game.create(user_id: user.id, winner_name: user.name, score: (Random.rand(1...14000)))
  end
}
