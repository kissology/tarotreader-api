# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_07_001116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "reading_cards", force: :cascade do |t|
    t.bigint "reading_id", null: false
    t.bigint "tarot_card_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_reading_cards_on_reading_id"
    t.index ["tarot_card_id"], name: "index_reading_cards_on_tarot_card_id"
  end

  create_table "reading_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade do |t|
    t.integer "client_id"
    t.bigint "reading_type_id", null: false
    t.datetime "reading_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_type_id"], name: "index_readings_on_reading_type_id"
  end

  create_table "reflections", force: :cascade do |t|
    t.bigint "reading_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_reflections_on_reading_id"
    t.index ["user_id"], name: "index_reflections_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarot_cards", force: :cascade do |t|
    t.string "name"
    t.string "img_link"
    t.string "arcana_type"
    t.string "element"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "phone_number"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "reading_cards", "readings"
  add_foreign_key "reading_cards", "tarot_cards"
  add_foreign_key "readings", "reading_types"
  add_foreign_key "reflections", "readings"
  add_foreign_key "reflections", "users"
  add_foreign_key "users", "roles"
end
