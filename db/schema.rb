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

ActiveRecord::Schema.define(version: 20151105204500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "meeting_start"
    t.datetime "meeting_end"
    t.integer  "timeslot_id"
    t.integer  "pitch_id"
  end

  add_index "appointments", ["pitch_id"], name: "index_appointments_on_pitch_id", using: :btree
  add_index "appointments", ["timeslot_id"], name: "index_appointments_on_timeslot_id", using: :btree

  create_table "pitches", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "image_url"
    t.datetime "proposed_time"
    t.boolean  "accepted"
    t.integer  "user_id"
    t.integer  "timeslot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pitches", ["timeslot_id"], name: "index_pitches_on_timeslot_id", using: :btree
  add_index "pitches", ["user_id"], name: "index_pitches_on_user_id", using: :btree

  create_table "timeslots", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "image_url"
    t.datetime "slot_start"
    t.datetime "slot_end"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timeslots", ["user_id"], name: "index_timeslots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "appointments", "pitches"
  add_foreign_key "appointments", "timeslots"
  add_foreign_key "pitches", "timeslots"
  add_foreign_key "pitches", "users"
  add_foreign_key "timeslots", "users"
end
