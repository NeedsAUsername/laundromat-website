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

ActiveRecord::Schema.define(version: 20180811004020) do

  create_table "orders", force: :cascade do |t|
    t.integer  "number"
    t.float    "weight"
    t.float    "price"
    t.datetime "date_made"
    t.boolean  "picked_up"
    t.boolean  "paid_for"
    t.string   "comments"
    t.integer  "user_id"
    t.boolean  "dropped_off"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.string  "phone"
    t.string  "preferences"
    t.string  "password_digest"
    t.string  "email"
    t.boolean "admin"
  end

end
