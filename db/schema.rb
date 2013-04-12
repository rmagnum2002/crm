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

ActiveRecord::Schema.define(:version => 20130412160835) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["trackable_id"], :name => "index_activities_on_trackable_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "addresses", :force => true do |t|
    t.integer  "company_id"
    t.boolean  "address_type"
    t.string   "country"
    t.string   "city"
    t.string   "postal_code"
    t.string   "street"
    t.string   "street_number"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "client_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "client_statuses", :force => true do |t|
    t.string   "client_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "client_types", :force => true do |t|
    t.string   "client_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.integer  "result_id"
    t.datetime "result_date"
    t.integer  "type_id"
    t.integer  "employee_id"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "companies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "responsible_id"
    t.string   "name"
    t.integer  "company_branch_id"
    t.integer  "company_source_id"
    t.integer  "client_category_id"
    t.integer  "client_type_id"
    t.date     "client_at"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "skype"
    t.string   "website"
    t.string   "facebook"
    t.string   "bank_req"
    t.integer  "fisc_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "client_status_id"
    t.integer  "number_employees"
    t.integer  "organizational_form_id"
  end

  create_table "company_branches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "company_sources", :force => true do |t|
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.integer  "gender"
    t.date     "birthday"
    t.integer  "language"
    t.integer  "company_id"
    t.integer  "job_title_id"
    t.boolean  "decision"
    t.string   "phone"
    t.string   "mobile"
    t.string   "simtravel"
    t.string   "email"
    t.string   "skype"
    t.string   "facebook"
    t.date     "client_date"
    t.string   "completion"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "title"
  end

  create_table "job_titles", :force => true do |t|
    t.string   "job_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "organizational_forms", :force => true do |t|
    t.string   "organizational_form"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

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
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
