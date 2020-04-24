# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_162852) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.integer "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "slot1"
    t.integer "slot2"
    t.integer "slot3"
    t.integer "slot4"
    t.integer "slot5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "icons", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "musics", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "image"
    t.string "comment"
    t.string "notesdesign"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "easy"
    t.integer "normal"
    t.integer "hard"
    t.string "music_id"
    t.float "bpm", default: 120.0, null: false
    t.string "dispbpm", default: "120.0", null: false
    t.string "color"
    t.integer "offset", default: 0, null: false
    t.integer "demo", default: 0, null: false
    t.binary "data"
  end

  create_table "results", force: :cascade do |t|
    t.integer "music_id"
    t.integer "p1_id"
    t.integer "p1_difficulty"
    t.integer "p1_score"
    t.integer "p1_perfect"
    t.integer "p1_great"
    t.integer "p1_good"
    t.integer "p1_bad"
    t.integer "p1_miss"
    t.integer "p2_id"
    t.integer "p2_difficulty"
    t.integer "p2_score"
    t.integer "p2_perfect"
    t.integer "p2_great"
    t.integer "p2_good"
    t.integer "p2_bad"
    t.integer "p2_miss"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nfcid", null: false
    t.string "mail"
    t.boolean "registered"
    t.integer "wincount"
    t.string "comment"
    t.boolean "slowfast"
    t.integer "hispeed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "public_uid"
    t.integer "icon_id", default: 1
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
  end

end
