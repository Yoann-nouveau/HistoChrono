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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_113911) do
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

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location"
    t.text "description"
    t.string "wikipedia_url"
    t.string "youtube_url"
    t.float "progess"
    t.bigint "period_id", null: false
    t.bigint "user_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["period_id"], name: "index_events_on_period_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "monuments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.string "wikipedia_url"
    t.string "google_earth_url"
    t.float "progess"
    t.float "latitude"
    t.float "longitude"
    t.bigint "period_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.text "description"
    t.string "wikipedia_url"
    t.bigint "period_id", null: false
    t.float "progess"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "votes", force: :cascade do |t|
    t.integer "vote"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "periods"
  add_foreign_key "events", "users"
  add_foreign_key "monuments", "periods"
  add_foreign_key "monuments", "users"
  add_foreign_key "personalities", "periods"
  add_foreign_key "personalities", "users"
  add_foreign_key "votes", "users"
end
