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

ActiveRecord::Schema.define(:version => 20110222035033) do

  create_table "course_types", :force => true do |t|
    t.string   "oldcode"
    t.string   "translation_code"
    t.string   "name"
    t.string   "description"
    t.integer  "last_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_types", ["name"], :name => "index_course_types_on_name", :unique => true
  add_index "course_types", ["translation_code"], :name => "index_course_types_on_translation_code", :unique => true

  create_table "languages", :force => true do |t|
    t.string   "iso_code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["iso_code"], :name => "index_languages_on_iso_code", :unique => true
  add_index "languages", ["name"], :name => "index_languages_on_name", :unique => true

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quota_schemas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotas", :force => true do |t|
    t.string   "name"
    t.integer  "initial_quota"
    t.integer  "quota"
    t.integer  "days_from_start_init_to_real"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.string   "username"
    t.string   "subdomain"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username", "subdomain"], :name => "index_users_on_username_and_subdomain", :unique => true

  create_table "whiteboard_types", :force => true do |t|
    t.string   "name"
    t.string   "translation_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "whiteboard_types", ["name"], :name => "index_whiteboard_types_on_name", :unique => true
  add_index "whiteboard_types", ["translation_code"], :name => "index_whiteboard_types_on_translation_code", :unique => true

  create_table "whiteboards", :force => true do |t|
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "whiteboard_type_id"
  end

end
