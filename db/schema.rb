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

ActiveRecord::Schema.define(version: 20150116172934) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "user_id"
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", force: true do |t|
    t.integer  "user_id"
    t.string   "provider",        limit: 50
    t.string   "uid"
    t.string   "token",           limit: 500
    t.datetime "expires_at"
    t.datetime "last_session_at"
    t.string   "last_session_ip"
    t.integer  "session_count",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["token"], name: "index_authorizations_on_token"
  add_index "authorizations", ["uid"], name: "index_authorizations_on_uid"
  add_index "authorizations", ["user_id", "provider"], name: "index_authorizations_on_user_id_and_provider"
  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "email_hash"
    t.string   "persistence_token"
    t.string   "api_key"
    t.integer  "role_id",           default: 0
    t.datetime "last_session_at"
    t.string   "last_session_ip"
    t.integer  "session_count",     default: 0
    t.integer  "failed_auth_count", default: 0
    t.integer  "created_by",        default: 0
    t.integer  "updated_by",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            default: true
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key"
  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
