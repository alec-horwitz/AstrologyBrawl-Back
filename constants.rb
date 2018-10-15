require_relative './base64Images.rb'

SIGNS = {
  "Aquarius" => {type: 'air', avatar: 'https://onehdwallpaper.com/wp-content/uploads/2015/08/Aquarius-Horoscope-Desktop-Backgrounds.jpg'},
  "Gemini" => {type: 'air', avatar: 'https://www.englishclub.com/efl/wp-content/uploads/2011/07/03c-Gemini.png'},
  "Libra" => {type: 'air', avatar: 'https://1.bp.blogspot.com/-dVGP128g-ns/UbTyCKx2H9I/AAAAAAAAAl0/9DelDJUENCU/s1600/Libra.jpg'},
  "Taurus" => {type: 'earth', avatar: 'https://2.bp.blogspot.com/_01YItv3gFfo/S8R4S2NwnMI/AAAAAAAAAJY/eqScVtI_Zb4/s1600/Taurus-Zodiac-Sign-1.jpeg'},
  "Virgo" => {type: 'earth', avatar: 'https://1.bp.blogspot.com/-C3Wv_yKA4U8/TiRe7toN5lI/AAAAAAAACT4/HEm3QnRw1k4/s1600/virgo11.jpg'},
  "Capricorn" => {type: 'earth', avatar: 'https://1.bp.blogspot.com/-vRML1Dg9ECg/UWg6fAv0EcI/AAAAAAAAFFo/3WaNG6V8j9s/s1600/zodiac1+capricorn.jpg'},
  "Pisces" => {type: 'water', avatar: 'https://4.bp.blogspot.com/-XAXArbVtBcY/UD9tPBPIfiI/AAAAAAAAIvY/ZVGw9jSoCoo/s1600/Pisces+Wallpapers.jpg'},
  "Cancer" => {type: 'water', avatar: 'https://4.bp.blogspot.com/-jF9rRjCTB-w/UI7svYw69uI/AAAAAAAATyM/X-2h4w_kQSg/s1600/4Cancer-Zodiac-Sign-1.jpeg'},
  "Scorpio" => {type: 'water', avatar: 'http://pixfeeds.com/images/18/463850/1200-614609158-scorpio-sign.jpg'},
  "Aries" => {type: 'fire', avatar: 'https://2.bp.blogspot.com/_WeQf3HIdYws/S_YL1j9bncI/AAAAAAAAAAc/1M-mJkzfMng/s1600/aries.jpg'},
  "Leo" => {type: 'fire', avatar: 'https://2.bp.blogspot.com/-1_2dylpfIqg/UV_hyTbRl_I/AAAAAAAAFAI/iZChMtwrNvo/s1600/Leo-Zodiac-Sign-1.jpeg'},
  "Sagittarius" => {type: 'fire', avatar: 'https://2.bp.blogspot.com/-obkvSdEM3jY/UWaJwGUfL7I/AAAAAAAAFEc/fTgiP_0KJaE/s1600/Sagittarius.jpeg'}
}


ARENA_IMAGE = {
  water: {water: wwpic, air: wapic, fire: wfpic, earth: wepic},
  air: {water: wapic, air: aapic, fire: afpic, earth: aepic},
  fire: {water: wfpic, air: afpic, fire: ffpic, earth: fepic},
  earth: {water: wepic, air: aepic, fire: fepic, earth: eepic},
}

ARENA_COLOR = {
  water: {water:"http://1x1px.me/0000FF-1.png", air:"http://1x1px.me/9292C1-1.png", fire:"http://1x1px.me/800080-1.png", earth:"http://1x1px.me/00555F-1.png"},
  air: {water:"http://1x1px.me/9292C1-1.png", air:"http://1x1px.me/7E7E7E-1.png", fire:"http://1x1px.me/FF8080-1.png", earth:"http://1x1px.me/80BD80-1.png"},
  fire: {water:"http://1x1px.me/800080-1.png", air:"http://1x1px.me/FF8080-1.png", fire:"http://1x1px.me/NFF0000-1.png", earth:"http://1x1px.me/DEA500-1.png"},
  earth: {water:"http://1x1px.me/00555F-1.png", air:"http://1x1px.me/80BD80-1.png", fire:"http://1x1px.me/DEA500-1.png", earth:"http://1x1px.me/00C800-1.png"},
}
