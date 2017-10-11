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

ActiveRecord::Schema.define(version: 20171010214455) do

  create_table "affiliated_schools", force: :cascade do |t|
    t.string   "title"
    t.string   "en_title"
    t.string   "url"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "rank"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

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
    t.string   "tag"
    t.text     "en_content"
    t.boolean  "hidden",           default: false
    t.boolean  "en_hidden",        default: false
    t.integer  "rank",             default: 0
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "rank",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "post_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "main_url"
    t.integer  "rank",       default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "tag"
    t.string   "en_title"
    t.boolean  "hidden",     default: false
    t.boolean  "en_hidden",  default: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "lab_programs", force: :cascade do |t|
    t.string   "title"
    t.string   "en_title"
    t.string   "file"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "en_title"
  end

  create_table "member_departments", force: :cascade do |t|
    t.string   "title"
    t.string   "en_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "full_title"
    t.text     "content"
    t.string   "image"
    t.string   "link"
    t.integer  "member_category_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "education_background"
    t.text     "en_content"
    t.integer  "member_department_id"
    t.integer  "rank",                 default: 0
    t.string   "en_name"
    t.string   "en_title"
    t.string   "en_full_title"
    t.index ["member_category_id"], name: "index_members_on_member_category_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "file"
    t.string   "alt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "album_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "en_title"
    t.string   "url"
    t.integer  "rank"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hidden",     default: false
    t.boolean  "en_hidden",  default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
