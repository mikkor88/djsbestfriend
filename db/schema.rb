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

ActiveRecord::Schema.define(:version => 20111206140523) do

  create_table "ownership_relationships", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "owned_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ownership_relationships", ["owned_record_id"], :name => "index_ownership_relationships_on_owned_record_id"
  add_index "ownership_relationships", ["owner_id"], :name => "index_ownership_relationships_on_owner_id"

  create_table "records", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "genre"
    t.string   "record_type"
    t.text     "comment"
    t.string   "catalog_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "year"
  end

  add_index "records", ["id", "title"], :name => "index_records_on_id_and_title"
  add_index "records", ["title", "catalog_number"], :name => "index_records_on_title_and_catalog_number", :unique => true

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "genre"
    t.integer  "year"
    t.integer  "track_number"
    t.integer  "bpm"
    t.time     "duration"
    t.integer  "record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["record_id", "track_number"], :name => "index_tracks_on_record_id_and_track_number"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
