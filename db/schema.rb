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

ActiveRecord::Schema[8.1].define(version: 2026_02_03_100800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "monitor_fetches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", default: "", null: false
    t.integer "poll_interval", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_monitor_fetches_on_user_id"
  end

  create_table "monitor_heartbeats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", default: "", null: false
    t.integer "time_considered_active", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_monitor_heartbeats_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "info", default: {}, null: false
    t.bigint "monitor_id", null: false
    t.string "monitor_type", null: false
    t.boolean "up", default: true, null: false
    t.datetime "updated_at", null: false
    t.index ["monitor_type", "monitor_id"], name: "index_reports_on_monitor"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "monitor_fetches", "users"
  add_foreign_key "monitor_heartbeats", "users"
end
