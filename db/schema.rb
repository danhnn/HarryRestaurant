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

ActiveRecord::Schema.define(version: 20160314014055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "food_item_id"
    t.string   "title"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["food_item_id"], name: "index_comments_on_food_item_id", using: :btree

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "section_id"
    t.integer  "views"
  end

  add_index "food_items", ["section_id"], name: "index_food_items_on_section_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "food_item_id"
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "quantity"
    t.string   "email"
    t.string   "coupon_code"
  end

  add_index "orders", ["food_item_id"], name: "index_orders_on_food_item_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "food_items"
  add_foreign_key "food_items", "sections"
  add_foreign_key "orders", "food_items"
end
