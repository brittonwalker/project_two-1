# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151117014356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "reason"
    t.string   "assets"
    t.string   "flag_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "target_id"
    t.boolean  "allies"
    t.boolean  "coordination"
    t.boolean  "enemies"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relations", ["country_id"], name: "index_relations_on_country_id", using: :btree
  add_index "relations", ["target_id"], name: "index_relations_on_target_id", using: :btree

  create_table "strikes", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "target_id"
    t.boolean  "airstrike"
    t.string   "date"
    t.integer  "time"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "strikes", ["country_id"], name: "index_strikes_on_country_id", using: :btree
  add_index "strikes", ["target_id"], name: "index_strikes_on_target_id", using: :btree

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "relations", "countries"
  add_foreign_key "relations", "targets"
  add_foreign_key "strikes", "countries"
  add_foreign_key "strikes", "targets"
end
