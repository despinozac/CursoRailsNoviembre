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

ActiveRecord::Schema.define(version: 20141119003326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: true do |t|
    t.date     "reservation_date"
    t.integer  "from"
    t.integer  "to"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.integer  "people_number"
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.integer  "max_people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "id_card"
    t.string   "mail"
    t.decimal  "grades_av"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
