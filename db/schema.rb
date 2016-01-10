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

ActiveRecord::Schema.define(version: 20160109141919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "city"
    t.integer "category_id"
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  add_index "addresses", ["category_id"], name: "index_addresses_on_category_id", using: :btree

  create_table "camels", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.text    "description", default: "koko"
  end

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "like_count",    default: 0
    t.integer  "dislike_count", default: 0
    t.integer  "emotion_count", default: 0
  end

  create_table "emotions", force: :cascade do |t|
    t.integer  "emotionable_id"
    t.string   "emotionable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "emotion"
  end

  add_index "emotions", ["emotionable_type", "emotionable_id"], name: "index_emotions_on_emotionable_type_and_emotionable_id", using: :btree

  create_table "horses", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "lock_version", default: 0
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.integer "org_id"
  end

  add_index "memberships", ["org_id", "role_id", "user_id"], name: "my_index", unique: true, order: {"org_id"=>:desc, "role_id"=>:desc, "user_id"=>:desc}, using: :btree
  add_index "memberships", ["org_id"], name: "index_memberships_on_org_id", using: :btree
  add_index "memberships", ["role_id"], name: "index_memberships_on_role_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "comment_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "like_count",    default: 0
    t.integer  "dislike_count", default: 0
    t.integer  "emotion_count", default: 0
  end

  add_index "replies", ["comment_id"], name: "index_replies_on_comment_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  add_index "roles", ["name"], name: "xxxx", unique: true, using: :btree

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
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "addresses", "categories"
  add_foreign_key "categories", "categories"
  add_foreign_key "memberships", "orgs"
  add_foreign_key "memberships", "roles"
  add_foreign_key "memberships", "users", on_delete: :nullify
  add_foreign_key "replies", "comments"
end
