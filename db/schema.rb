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

ActiveRecord::Schema.define(version: 20140312173059) do

  create_table "blog_comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "blogpost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_comments", ["blogpost_id", "created_at"], name: "index_blog_comments_on_blogpost_id_and_created_at"

  create_table "blogcomments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "blogpost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogcomments", ["blogpost_id", "created_at"], name: "index_blogcomments_on_blogpost_id_and_created_at"

  create_table "blogposts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogposts", ["user_id", "created_at"], name: "index_blogposts_on_user_id_and_created_at"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "rated"
    t.string   "released"
    t.string   "runtime"
    t.string   "genre"
    t.string   "director"
    t.string   "writer"
    t.string   "actors"
    t.string   "plot"
    t.string   "language"
    t.string   "country"
    t.string   "awards"
    t.string   "poster"
    t.string   "imdb_rating"
    t.string   "imdb_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["imdb_id"], name: "index_movies_on_imdb_id", unique: true
  add_index "movies", ["title"], name: "index_movies_on_title"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
