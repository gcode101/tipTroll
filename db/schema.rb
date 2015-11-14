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

ActiveRecord::Schema.define(version: 20151114003637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cust_ratings", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "professional_id"
    t.integer  "score",           default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "cust_ratings", ["customer_id"], name: "index_cust_ratings_on_customer_id", using: :btree
  add_index "cust_ratings", ["professional_id"], name: "index_cust_ratings_on_professional_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "professional_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "favorites", ["customer_id"], name: "index_favorites_on_customer_id", using: :btree
  add_index "favorites", ["professional_id"], name: "index_favorites_on_professional_id", using: :btree

  create_table "pro_ratings", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "professional_id"
    t.integer  "score",           default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "pro_ratings", ["customer_id"], name: "index_pro_ratings_on_customer_id", using: :btree
  add_index "pro_ratings", ["professional_id"], name: "index_pro_ratings_on_professional_id", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "job_location"
    t.string   "job_title"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "picture"
    t.integer  "rating_score"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "student"
    t.text     "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tutor_id"
    t.integer  "tutorid"
  end

  add_index "tickets", ["tutor_id"], name: "index_tickets_on_tutor_id", using: :btree

  create_table "tips", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "professional_id"
    t.float    "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tips", ["customer_id"], name: "index_tips_on_customer_id", using: :btree
  add_index "tips", ["professional_id"], name: "index_tips_on_professional_id", using: :btree

  create_table "tutors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cust_ratings", "customers"
  add_foreign_key "cust_ratings", "professionals"
  add_foreign_key "favorites", "customers"
  add_foreign_key "favorites", "professionals"
  add_foreign_key "pro_ratings", "customers"
  add_foreign_key "pro_ratings", "professionals"
  add_foreign_key "tickets", "tutors"
  add_foreign_key "tips", "customers"
  add_foreign_key "tips", "professionals"
end
