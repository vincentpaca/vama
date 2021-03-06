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

ActiveRecord::Schema.define(:version => 20130204130729) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "purchase_id"
    t.decimal  "amount",      :precision => 20, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "model"
    t.string   "power"
    t.string   "engine"
    t.string   "cylinders"
    t.string   "facebook_link"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "facebook_album_link"
    t.boolean  "reserved",            :default => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "full_name"
    t.string   "address"
    t.string   "contact_number"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "reservation_id"
    t.decimal  "contract_amount",      :precision => 20, :scale => 2
    t.decimal  "price",                :precision => 20, :scale => 2
    t.decimal  "down_payment",         :precision => 20, :scale => 2
    t.integer  "term_in_months"
    t.decimal  "monthly_amortization", :precision => 20, :scale => 2
    t.decimal  "balance",              :precision => 20, :scale => 2
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "approved",                  :default => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "info_sheet_file_name"
    t.string   "info_sheet_content_type"
    t.integer  "info_sheet_file_size"
    t.datetime "info_sheet_updated_at"
    t.string   "deposit_slip_file_name"
    t.string   "deposit_slip_content_type"
    t.integer  "deposit_slip_file_size"
    t.datetime "deposit_slip_updated_at"
    t.string   "ids_file_name"
    t.string   "ids_content_type"
    t.integer  "ids_file_size"
    t.datetime "ids_updated_at"
    t.string   "proof_income_file_name"
    t.string   "proof_income_content_type"
    t.integer  "proof_income_file_size"
    t.datetime "proof_income_updated_at"
    t.string   "dti_file_name"
    t.string   "dti_content_type"
    t.integer  "dti_file_size"
    t.datetime "dti_updated_at"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
