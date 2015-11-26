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

ActiveRecord::Schema.define(version: 20151126171805) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "day"
  end

  add_index "bookings", ["service_id"], name: "index_bookings_on_service_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "calendars", force: :cascade do |t|
    t.date     "day"
    t.boolean  "available"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "hairdresser_id"
  end

  add_index "calendars", ["hairdresser_id"], name: "index_calendars_on_hairdresser_id"

  create_table "hairdressers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "lat"
    t.float    "lng"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.string   "photo"
    t.integer  "hairdresser_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "services", ["hairdresser_id"], name: "index_services_on_hairdresser_id"

  create_table "slots", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "calendar_id"
  end

  add_index "slots", ["calendar_id"], name: "index_slots_on_calendar_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
