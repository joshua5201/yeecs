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

ActiveRecord::Schema.define(version: 20170522105312) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.string   "url"
    t.string   "image"
    t.string   "type"
    t.integer  "category_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "is_pure_link",     default: false
    t.string   "en_title"
    t.integer  "post_category_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "rank",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "article_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "main_url"
    t.integer  "rank",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "tag"
    t.string   "en_title"
  end

  create_table "link_blocks", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "rank",       default: 0
    t.string   "url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "full_title"
    t.text     "content"
    t.string   "image"
    t.string   "link"
    t.integer  "member_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["member_category_id"], name: "index_members_on_member_category_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "en_title"
    t.string   "url"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
