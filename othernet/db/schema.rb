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

ActiveRecord::Schema.define(version: 20170419183355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "neighbors", force: :cascade do |t|
    t.string   "another_name",           default: "", null: false
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "neighbors", ["another_name"], name: "index_neighbors_on_another_name", unique: true, using: :btree
  add_index "neighbors", ["reset_password_token"], name: "index_neighbors_on_reset_password_token", unique: true, using: :btree

  create_table "neighbors_roles", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "neighbor_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", force: :cascade do |t|
    t.integer  "webpage_id"
    t.string   "name"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webpages", force: :cascade do |t|
    t.integer  "neighbor_id"
    t.integer  "type_id"
    t.string   "name"
    t.boolean  "publish",               default: false
    t.text     "html"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",                           null: false
    t.string   "otherpic"
    t.string   "bg_img"
    t.string   "title"
    t.string   "headline"
    t.string   "section_one_title"
    t.string   "section_one_content"
    t.string   "section_two_title"
    t.string   "section_two_content"
    t.string   "section_three_title"
    t.string   "section_three_content"
    t.string   "text_under_image"
  end

end
