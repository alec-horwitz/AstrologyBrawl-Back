# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'


stockAvatars = {
  'https://onehdwallpaper.com/wp-content/uploads/2015/08/Aquarius-Horoscope-Desktop-Backgrounds.jpg': 'air',
  'https://www.englishclub.com/efl/wp-content/uploads/2011/07/03c-Gemini.png': 'air',
  'https://1.bp.blogspot.com/-dVGP128g-ns/UbTyCKx2H9I/AAAAAAAAAl0/9DelDJUENCU/s1600/Libra.jpg': 'air',
  'https://2.bp.blogspot.com/_01YItv3gFfo/S8R4S2NwnMI/AAAAAAAAAJY/eqScVtI_Zb4/s1600/Taurus-Zodiac-Sign-1.jpeg': 'earth',
  'https://1.bp.blogspot.com/-C3Wv_yKA4U8/TiRe7toN5lI/AAAAAAAACT4/HEm3QnRw1k4/s1600/virgo11.jpg': 'earth',
  'https://1.bp.blogspot.com/-vRML1Dg9ECg/UWg6fAv0EcI/AAAAAAAAFFo/3WaNG6V8j9s/s1600/zodiac1+capricorn.jpg': 'earth',
  'https://4.bp.blogspot.com/-XAXArbVtBcY/UD9tPBPIfiI/AAAAAAAAIvY/ZVGw9jSoCoo/s1600/Pisces+Wallpapers.jpg': 'water',
  'https://4.bp.blogspot.com/-jF9rRjCTB-w/UI7svYw69uI/AAAAAAAATyM/X-2h4w_kQSg/s1600/4Cancer-Zodiac-Sign-1.jpeg': 'water',
  'http://pixfeeds.com/images/18/463850/1200-614609158-scorpio-sign.jpg': 'water',
  'https://2.bp.blogspot.com/_WeQf3HIdYws/S_YL1j9bncI/AAAAAAAAAAc/1M-mJkzfMng/s1600/aries.jpg': 'fire',
  'https://2.bp.blogspot.com/-1_2dylpfIqg/UV_hyTbRl_I/AAAAAAAAFAI/iZChMtwrNvo/s1600/Leo-Zodiac-Sign-1.jpeg': 'fire',
  'https://2.bp.blogspot.com/-obkvSdEM3jY/UWaJwGUfL7I/AAAAAAAAFEc/fTgiP_0KJaE/s1600/Sagittarius.jpeg': 'fire'
}

stockMain = 15
stockAttack = 5
stockDefence = 5
types = ["earth", "air", "fire", "water"]
stockUsernames = ["Moxareck", "AstroMonkey77", "ProfaneFontaine", "GreenRanger19", "CyberCat<(^.^<)", "Alec", "No.3037","64BitRick","Leo-E","test","HellGaze451","RedGhost11"]

index = 0
stockAvatars.each { |avatar, element|
  User.create(name: stockUsernames[index], password: "test", avatar: avatar, main: stockMain, attack: stockAttack, defence: stockDefence, type1: element, type2: types[Random.rand(0...4)], type3: types[Random.rand(0...4)])
  index = index + 1
}

User.all.each { |user|
  Random.rand(1...6).times do
    Game.create(user_id: user.id, playername: user.name, score: (Random.rand(1...14000)))
  end
}
