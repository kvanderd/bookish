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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130819224818) do

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "story_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "structure"
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.string   "author_first_name"
    t.string   "author_last_name"
    t.text     "copyright_info"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "author"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "widget_templates", :force => true do |t|
    t.string   "name"
    t.string   "classtype"
    t.text     "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "widgets", :force => true do |t|
    t.text     "html_block_1"
    t.string   "name"
    t.string   "type"
    t.integer  "page_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
