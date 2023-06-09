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

ActiveRecord::Schema[7.0].define(version: 2023_06_14_125144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "approvals", force: :cascade do |t|
    t.integer "vote"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "voteable_type", null: false
    t.bigint "voteable_id", null: false
    t.index ["user_id"], name: "index_approvals_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable"
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.string "wikipedia_url"
    t.string "youtube_url"
    t.integer "progress", default: 0
    t.bigint "period_id", null: false
    t.bigint "user_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "start_day"
    t.integer "start_month"
    t.integer "start_year"
    t.integer "end_day"
    t.integer "end_month"
    t.integer "end_year"
    t.string "address"
    t.index ["period_id"], name: "index_events_on_period_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "monuments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "wikipedia_url"
    t.string "google_earth_url"
    t.integer "progress", default: 0
    t.float "latitude"
    t.float "longitude"
    t.bigint "period_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["period_id"], name: "index_monuments_on_period_id"
    t.index ["user_id"], name: "index_monuments_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.json "polygons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personalities", force: :cascade do |t|
    t.string "fullname"
    t.text "description"
    t.string "wikipedia_url"
    t.bigint "period_id", null: false
    t.integer "progress", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "birth_day"
    t.integer "birth_month"
    t.integer "birth_year"
    t.integer "death_day"
    t.integer "death_month"
    t.integer "death_year"
    t.index ["period_id"], name: "index_personalities_on_period_id"
    t.index ["user_id"], name: "index_personalities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approvals", "users"
  add_foreign_key "events", "periods"
  add_foreign_key "events", "users"
  add_foreign_key "monuments", "periods"
  add_foreign_key "monuments", "users"
  add_foreign_key "personalities", "periods"
  add_foreign_key "personalities", "users"
end
