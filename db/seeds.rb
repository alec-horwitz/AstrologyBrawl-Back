# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

stockAvatar = "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-business-bear.png"
stockMain = 15
stockAttack = 5
stockDefence = 5
types = ["earth", "air", "fire", "water"]
stockUsernames = ["HellGaze492", "RedGhost11", "Leo-E", "Moxareck", "CyberCat<(^.^<)", "ProfaneFontain", "No.3037"]

# User.destroy_all
# Game.destroy_all

stockUsernames.each { |username|
  User.create(name: username, avatar: stockAvatar, main: stockMain, attack: stockAttack, defence: stockDefence, type1: types[Random.rand(0...4)], type2: types[Random.rand(0...4)], type3: types[Random.rand(0...4)])
}

User.all.each { |user|
  Random.rand(1...6).times do
    Game.create(user_id: user.id, playername: user.name, score: Random.rand(1...1000))
  end
}
