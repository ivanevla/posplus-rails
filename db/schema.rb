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

ActiveRecord::Schema.define(version: 20141203130652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "course_researchers", force: true do |t|
    t.integer "course_id"
    t.integer "researcher_id"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publication_id"
    t.string   "description"
  end

  create_table "features", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.string   "document"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
  end

  create_table "project_publications", force: true do |t|
    t.integer "research_project_id"
    t.integer "publication_id"
  end

  create_table "project_researchers", force: true do |t|
    t.integer "research_project_id"
    t.integer "researcher_id"
  end

  create_table "publication_researchers", force: true do |t|
    t.integer "publication_id"
    t.integer "researcher_id"
  end

  create_table "publications", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.boolean  "visible"
    t.integer  "category_id"
    t.integer  "year"
    t.integer  "series"
  end

  create_table "research_groups", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_projects", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "active"
  end

  create_table "research_themes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "researchers", force: true do |t|
    t.string   "first_name"
    t.text     "bio"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "visible",      default: true
    t.string   "last_name"
    t.boolean  "active",       default: true
    t.string   "phone"
    t.text     "address"
    t.string   "bibliography"
  end

  create_table "theme_projects", force: true do |t|
    t.integer "research_theme_id"
    t.integer "research_project_id"
  end

  create_table "users", force: true do |t|
    t.string  "full_name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin"
  end

end
