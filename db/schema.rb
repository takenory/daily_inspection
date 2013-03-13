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

ActiveRecord::Schema.define(:version => 20130312162277) do

  create_table "checks", :force => true do |t|
    t.integer  "inspection_id"
    t.integer  "part_id"
    t.string   "item",               :limit => 40
    t.string   "operation",          :limit => 80
    t.string   "criterion",          :limit => 80
    t.integer  "entry_type"
    t.string   "unit_name"
    t.integer  "sequence"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.integer  "parent_id"
    t.integer  "cycle_id"
    t.string   "cycle_title"
    t.datetime "scheduled_datetime",                                             :null => false
    t.string   "part_name"
    t.decimal  "upper_limit",                      :precision => 8, :scale => 4
    t.decimal  "lower_limit",                      :precision => 8, :scale => 4
  end

  create_table "cycles", :force => true do |t|
    t.string   "title"
    t.integer  "unit_type"
    t.integer  "interval"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "station_id"
  end

  create_table "inspections", :force => true do |t|
    t.string   "staff_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "equipment_id"
  end

  create_table "results", :force => true do |t|
    t.integer  "check_id"
    t.boolean  "judgment"
    t.string   "abnormal_content"
    t.integer  "corrective_action"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.datetime "checked_datetime"
    t.string   "corrective_content"
    t.string   "staff_code"
    t.datetime "corrected_datetime"
    t.decimal  "measured_value",     :precision => 8, :scale => 4
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
