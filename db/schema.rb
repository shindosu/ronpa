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

ActiveRecord::Schema.define(version: 2019_11_19_044306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arguments", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "user_id"
    t.string "content"
    t.integer "side"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_arguments_on_topic_id"
    t.index ["user_id"], name: "index_arguments_on_user_id"
  end

  create_table "debates", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "phase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_debates_on_topic_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "debate_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debate_id"], name: "index_participants_on_debate_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "proposition"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "username"
    t.integer "language_level"
    t.boolean "admin", default: false
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "uses", force: :cascade do |t|
    t.bigint "debate_id"
    t.bigint "user_id"
    t.boolean "success", default: true
    t.string "content"
    t.integer "side"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debate_id"], name: "index_uses_on_debate_id"
    t.index ["user_id"], name: "index_uses_on_user_id"
  end

  add_foreign_key "arguments", "topics"
  add_foreign_key "arguments", "users"
  add_foreign_key "debates", "topics"
  add_foreign_key "participants", "debates"
  add_foreign_key "participants", "users"
  add_foreign_key "uses", "debates"
  add_foreign_key "uses", "users"
end
