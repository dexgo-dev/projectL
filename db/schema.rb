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

ActiveRecord::Schema.define(version: 20160915095916) do

  create_table "note_events", force: :cascade do |t|
    t.integer  "note_id"
    t.integer  "event_type_id"
    t.integer  "user_id"
    t.text     "note_text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "note_text"
    t.integer  "participant_id"
    t.integer  "user_id"
    t.boolean  "important"
    t.datetime "notify_on"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "gender",         limit: 255
    t.date     "date_of_birth"
    t.string   "contact_number", limit: 255
    t.text     "home_address"
    t.string   "email",          limit: 255
    t.boolean  "active"
    t.integer  "study_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "studies", force: :cascade do |t|
    t.text     "description"
    t.string   "study_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",       limit: 255
    t.string   "password",       limit: 255
    t.string   "full_name",      limit: 255
    t.string   "email",          limit: 255
    t.string   "contact_number", limit: 255
    t.integer  "team_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
