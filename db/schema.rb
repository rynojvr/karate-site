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

ActiveRecord::Schema.define(version: 20180506120018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "cell"
    t.string "email"
    t.string "sensei"
    t.string "contact_number"
    t.string "landline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "district_id"
    t.index ["district_id"], name: "index_clubs_on_district_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "province_id"
    t.string "slug"
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "race"
    t.string "residential_address"
    t.string "code"
    t.string "cell_number"
    t.string "email"
    t.integer "current_weight"
    t.integer "current_height"
    t.string "belt"
    t.boolean "is_affiliated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "club_id"
    t.index ["club_id"], name: "index_members_on_club_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clubs", "districts"
  add_foreign_key "districts", "provinces"
  add_foreign_key "members", "clubs"
end
