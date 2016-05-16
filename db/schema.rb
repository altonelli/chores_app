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

ActiveRecord::Schema.define(version: 20160516182023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: :cascade do |t|
    t.string   "title"
    t.string   "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_users", force: :cascade do |t|
    t.string   "state"
    t.integer  "user_id"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "unit_users", ["unit_id"], name: "index_unit_users_on_unit_id", using: :btree
  add_index "unit_users", ["user_id"], name: "index_unit_users_on_user_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "landlord_name"
    t.string   "landlord_phone"
    t.string   "landlord_email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_chores", force: :cascade do |t|
    t.datetime "due_date"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "chore_id"
  end

  add_index "user_chores", ["chore_id"], name: "index_user_chores_on_chore_id", using: :btree
  add_index "user_chores", ["user_id"], name: "index_user_chores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "unit_id"
    t.string   "password_digest"
  end

  add_index "users", ["unit_id"], name: "index_users_on_unit_id", using: :btree

  add_foreign_key "unit_users", "units"
  add_foreign_key "unit_users", "users"
  add_foreign_key "user_chores", "chores"
  add_foreign_key "user_chores", "users"
  add_foreign_key "users", "units"
end
