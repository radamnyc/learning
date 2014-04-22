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

ActiveRecord::Schema.define(version: 0) do

  create_table "Addresses", force: true do |t|
    t.string    "guid",                                                             null: false
    t.string    "address1",                                                         null: false
    t.string    "address2",                                                         null: false
    t.string    "city",                                                             null: false
    t.string    "state",                                                            null: false
    t.string    "zip",            limit: 10,                                        null: false
    t.decimal   "lat",                       precision: 10, scale: 6
    t.decimal   "lng",                       precision: 10, scale: 6
    t.timestamp "created_at",                                                       null: false
    t.timestamp "updated_at",                                                       null: false
    t.string    "logical_delete", limit: 1,                           default: "N", null: false
  end

  add_index "addresses", ["guid"], name: "guid", unique: true, using: :btree

  create_table "Events", force: true do |t|
    t.string    "guid",                                                                     null: false
    t.integer   "user_id",                                                                  null: false
    t.timestamp "event_date",                                                               null: false
    t.text      "description",                                                              null: false
    t.string    "quisine",            limit: 9,                         default: "Mystery", null: false
    t.decimal   "suggested_donation",           precision: 6, scale: 2,                     null: false
    t.integer   "max_participants",                                                         null: false
    t.string    "active",             limit: 1,                         default: "N",       null: false
    t.integer   "address_id",                                                               null: false
    t.timestamp "created_at",                                                               null: false
    t.timestamp "updated_at",                                                               null: false
    t.string    "logical_delete",     limit: 1,                         default: "N",       null: false
  end

  add_index "events", ["guid"], name: "guid", unique: true, using: :btree

  create_table "Participants", force: true do |t|
    t.integer   "event_id",                                       null: false
    t.integer   "user_id",                                        null: false
    t.string    "status",         limit: 9, default: "Requested", null: false
    t.timestamp "created_at",                                     null: false
    t.timestamp "updated_at",                                     null: false
    t.string    "logical_delete", limit: 1, default: "N",         null: false
  end

  add_index "participants", ["event_id", "user_id"], name: "event_user", unique: true, using: :btree

  create_table "Users", force: true do |t|
    t.string    "guid",                                    null: false
    t.string    "email",                                   null: false
    t.string    "password_digest"
    t.string    "first_name",                              null: false
    t.string    "last_name"
    t.string    "phone"
    t.integer   "address_id"
    t.timestamp "created_at",                              null: false
    t.timestamp "updated_at",                              null: false
    t.string    "logical_delete",  limit: 1, default: "N", null: false
  end

  add_index "users", ["email"], name: "email", unique: true, using: :btree
  add_index "users", ["guid"], name: "guid", unique: true, using: :btree

end
