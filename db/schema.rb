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

ActiveRecord::Schema.define(version: 20150225211649) do

  create_table "api_tokens", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "token",      limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authie_sessions", force: :cascade do |t|
    t.string   "token",              limit: 255
    t.string   "browser_id",         limit: 255
    t.integer  "user_id",            limit: 4
    t.boolean  "active",             limit: 1,     default: true
    t.text     "data",               limit: 65535
    t.datetime "expires_at"
    t.datetime "login_at"
    t.string   "login_ip",           limit: 255
    t.datetime "last_activity_at"
    t.string   "last_activity_ip",   limit: 255
    t.string   "last_activity_path", limit: 255
    t.string   "user_agent",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",          limit: 255
    t.integer  "parent_id",          limit: 4
  end

  add_index "authie_sessions", ["browser_id"], name: "index_authie_sessions_on_browser_id", using: :btree
  add_index "authie_sessions", ["token"], name: "index_authie_sessions_on_token", using: :btree
  add_index "authie_sessions", ["user_id"], name: "index_authie_sessions_on_user_id", using: :btree

  create_table "history_items", force: :cascade do |t|
    t.string   "item_type", limit: 255
    t.integer  "item_id",   limit: 4
    t.datetime "date"
  end

  create_table "issue_service_joins", force: :cascade do |t|
    t.integer  "issue_id",   limit: 4
    t.integer  "service_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "issue_updates", force: :cascade do |t|
    t.integer  "issue_id",          limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "service_status_id", limit: 4
    t.string   "state",             limit: 255
    t.text     "text",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "identifier",        limit: 255
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "state",             limit: 255
    t.integer  "service_status_id", limit: 4
    t.boolean  "all_services",      limit: 1,   default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id",           limit: 4
    t.string   "identifier",        limit: 255
  end

  create_table "maintenance_service_joins", force: :cascade do |t|
    t.integer  "maintenance_id", limit: 4
    t.integer  "service_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "maintenance_updates", force: :cascade do |t|
    t.integer  "maintenance_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.text     "text",           limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "identifier",     limit: 255
  end

  create_table "maintenances", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer  "length_in_minutes", limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "service_status_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "closed_at"
    t.string   "identifier",        limit: 255
  end

  create_table "nifty_attachments", force: :cascade do |t|
    t.integer  "parent_id",   limit: 4
    t.string   "parent_type", limit: 255
    t.string   "token",       limit: 255
    t.string   "digest",      limit: 255
    t.string   "role",        limit: 255
    t.string   "file_name",   limit: 255
    t.string   "file_type",   limit: 255
    t.binary   "data",        limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_statuses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "permalink",   limit: 255
    t.string   "color",       limit: 255
    t.string   "status_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "permalink",   limit: 255
    t.integer  "position",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status_id",   limit: 4
    t.text     "description", limit: 65535
  end

  create_table "sites", force: :cascade do |t|
    t.string  "title",              limit: 255
    t.string  "description",        limit: 255
    t.string  "domain",             limit: 255
    t.string  "support_email",      limit: 255
    t.string  "website_url",        limit: 255
    t.string  "time_zone",          limit: 255
    t.boolean "crawling_permitted", limit: 1,   default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email_address",   limit: 255
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
