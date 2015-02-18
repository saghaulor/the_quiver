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

ActiveRecord::Schema.define(version: 20150217002352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "round_ends", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "distance"
    t.integer  "uom_id",     default: 1
    t.string   "shots",      default: [],                 array: true
    t.integer  "score"
    t.boolean  "mulligan",   default: false
    t.integer  "x_count"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "round_ends", ["round_id"], name: "index_round_ends_on_round_id", using: :btree
  add_index "round_ends", ["uom_id"], name: "index_round_ends_on_uom_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rounds", ["user_id"], name: "index_rounds_on_user_id", using: :btree

  create_table "uoms", force: :cascade do |t|
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
