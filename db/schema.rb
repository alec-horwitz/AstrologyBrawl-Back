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
    t.string "playername"
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
    t.string "password"
    t.string "email"
    t.string "avatar", default: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-business-bear.png"
    t.string "main"
    t.string "attack"
    t.string "defence"
    t.string "type1"
    t.string "type2"
    t.string "type3"
    t.string "level"
    t.string "experience"
    t.string "points"
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

end
