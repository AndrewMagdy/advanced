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

ActiveRecord::Schema.define(version: 20151215224511) do

  create_table "Projects_Users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "project_id", limit: 4, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "direct_messages", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4
    t.integer  "receiver_id", limit: 4
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend_id",  limit: 4
    t.boolean  "accepted"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title",        limit: 65535
    t.text     "body",         limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "recepient_id", limit: 4
  end

  create_table "project_messages", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "sender_id",  limit: 4
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name",        limit: 255
    t.string   "project_description", limit: 255
    t.string   "project_type",        limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",       limit: 4
    t.integer  "privacy_level", limit: 4
    t.integer  "profile_color", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "user_name",        limit: 255
    t.string   "password",         limit: 255
    t.string   "loc_city",         limit: 255
    t.string   "loc_country",      limit: 255
    t.date     "dob"
    t.string   "profile_pic",      limit: 255
    t.string   "gender",           limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.string   "email",            limit: 255
    t.string   "name",             limit: 255
  end

end
