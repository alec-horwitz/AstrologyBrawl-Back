require_relative './base64ArenaImages.rb'
require_relative './base64Avatar.rb'

SIGNS = {
  "Aquarius" => {type: 'air', avatar: AQUARIUS},
  "Gemini" => {type: 'air', avatar: GEMINI},
  "Libra" => {type: 'air', avatar: LIBRA},
  "Taurus" => {type: 'earth', avatar: TAURUS},
  "Virgo" => {type: 'earth', avatar: VIRGO},
  "Capricorn" => {type: 'earth', avatar: CAPRICORN},
  "Pisces" => {type: 'water', avatar: PISCES},
  "Cancer" => {type: 'water', avatar: CANCER},
  "Scorpio" => {type: 'water', avatar: SCORPIO},
  "Aries" => {type: 'fire', avatar: ARIES},
  "Leo" => {type: 'fire', avatar: LEO},
  "Sagittarius" => {type: 'fire', avatar: SAGITTARIUS}
}


ARENA_IMAGE = {
  water: {water: WWPIC, air: WAPIC, fire: WFPIC, earth: WEPIC},
  air: {water: WAPIC, air: AAPIC, fire: AFPIC, earth: AEPIC},
  fire: {water: WFPIC, air: AFPIC, fire: FFPIC, earth: FEPIC},
  earth: {water: WEPIC, air: AEPIC, fire: FEPIC, earth: EEPIC},
}

ARENA_COLOR = {
  water: {water:"http://1x1px.me/0000FF-1.png", air:"http://1x1px.me/9292C1-1.png", fire:"http://1x1px.me/800080-1.png", earth:"http://1x1px.me/00555F-1.png"},
  air: {water:"http://1x1px.me/9292C1-1.png", air:"http://1x1px.me/7E7E7E-1.png", fire:"http://1x1px.me/FF8080-1.png", earth:"http://1x1px.me/80BD80-1.png"},
  fire: {water:"http://1x1px.me/800080-1.png", air:"http://1x1px.me/FF8080-1.png", fire:"http://1x1px.me/NFF0000-1.png", earth:"http://1x1px.me/DEA500-1.png"},
  earth: {water:"http://1x1px.me/00555F-1.png", air:"http://1x1px.me/80BD80-1.png", fire:"http://1x1px.me/DEA500-1.png", earth:"http://1x1px.me/00C800-1.png"},
}
