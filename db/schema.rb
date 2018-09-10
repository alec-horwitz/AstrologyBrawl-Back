# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180416175657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "winner_id"
    t.string "winner"
    t.string "winner_name"
    t.string "winner_health"
    t.string "winner_mod"
    t.integer "loser_id"
    t.string "loser"
    t.string "loser_name"
    t.string "loser_health"
    t.string "loser_mod"
    t.string "killing_blow"
    t.string "game_mod"
    t.string "arena", default: "https://il6.picdn.net/shutterstock/videos/711148/thumb/1.jpg"
    t.string "score"
    t.string "mod0"
    t.string "mod1"
    t.string "mod2"
    t.string "mod3"
    t.string "mod4"
    t.string "mod5"
    t.string "mod6"
    t.string "mod7"
    t.string "mod8"
    t.string "mod9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.string "avatar", default: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-business-bear.png"
    t.string "sub_avatar1", default: "http://downloadicons.net/sites/default/files/exclamation-warning-icon-91894.png"
    t.string "sub_avatar2", default: "http://downloadicons.net/sites/default/files/exclamation-warning-icon-91894.png"
    t.string "sub_avatar3", default: "http://downloadicons.net/sites/default/files/exclamation-warning-icon-91894.png"
    t.string "main"
    t.string "attack"
    t.string "defence"
    t.string "sign1"
    t.string "sign2"
    t.string "sign3"
    t.string "type1"
    t.string "type2"
    t.string "type3"
    t.string "level"
    t.string "health"
    t.string "experience"
    t.string "points"
    t.string "score"
    t.string "inventory"
    t.string "slot0"
    t.string "slot1"
    t.string "slot2"
    t.string "slot3"
    t.string "slot4"
    t.string "slot5"
    t.string "slot6"
    t.string "slot7"
    t.string "slot8"
    t.string "slot9"
    t.string "mod0"
    t.string "mod1"
    t.string "mod2"
    t.string "mod3"
    t.string "mod4"
    t.string "mod5"
    t.string "mod6"
    t.string "mod7"
    t.string "mod8"
    t.string "mod9"
    t.string "status", default: "Your Turn"
    t.string "animation", default: "pulse"
    t.string "visible", default: "true"
    t.string "hp", default: "100"
    t.string "defending", default: "false"
    t.string "charged", default: "false"
    t.string "action"
    t.string "active_slot", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
