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

ActiveRecord::Schema.define(:version => 20130916142552) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "apk_file_name"
    t.string   "apk_content_type"
    t.integer  "apk_file_size"
    t.datetime "apk_updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "publisher"
    t.datetime "published_at"
    t.integer  "book_coin"
    t.boolean  "published"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "isbn"
    t.text     "contents"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "download_link"
  end

  create_table "cartoon_tmps", :force => true do |t|
    t.string   "title"
    t.string   "thumb_pic_url"
    t.string   "details_url"
    t.boolean  "scraped"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "scrap_page"
    t.integer  "scrap_source_id"
  end

  create_table "cartoons", :force => true do |t|
    t.string   "title"
    t.integer  "download_number"
    t.integer  "cost_money"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "requested_number"
    t.string   "thumb_pic_file_name"
    t.string   "thumb_pic_content_type"
    t.integer  "thumb_pic_file_size"
    t.datetime "thumb_pic_updated_at"
    t.string   "original_pic_file_name"
    t.string   "original_pic_content_type"
    t.integer  "original_pic_file_size"
    t.datetime "original_pic_updated_at"
    t.integer  "show_times"
    t.integer  "download_times"
    t.integer  "page_in"
    t.integer  "scrap_source_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "cartoon_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "book_id"
  end

  create_table "scrap_sources", :force => true do |t|
    t.string   "name"
    t.string   "src_url"
    t.integer  "total_pages"
    t.integer  "curr_page"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "sections", :force => true do |t|
    t.integer  "book_id"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "section_number"
    t.string   "name"
  end

  add_index "sections", ["book_id"], :name => "index_sections_on_book_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
