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

ActiveRecord::Schema.define(version: 2018_05_05_230115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "editor_sessions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exercise_id"
    t.text "editor_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "e_id"
    t.string "name"
    t.string "slug"
    t.string "category"
    t.string "url"
    t.text "rank"
    t.text "description"
    t.integer "totalStars"
    t.integer "voteScore"
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
