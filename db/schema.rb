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

ActiveRecord::Schema.define(:version => 20130117205318) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "address"
    t.text     "description"
    t.string   "link"
    t.float    "rating"
    t.boolean  "complete"
    t.integer  "trip_element_id"
    t.string   "trip_element_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "days", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "description"
    t.boolean  "complete"
    t.float    "rating"
    t.text     "diary"
    t.integer  "trip_location_id"
    t.string   "trip_location_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "trip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "complete"
    t.float    "rating"
    t.text     "description"
    t.string   "category"
    t.text     "diary"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
