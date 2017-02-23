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

ActiveRecord::Schema.define(version: 20161216061022) do

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participant_id"
    t.text     "note_text",              limit: 65535
    t.boolean  "important"
    t.integer  "user_id"
    t.datetime "notify_on"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "notify"
    t.boolean  "isDone"
    t.datetime "doneOn"
    t.integer  "doneBy"
    t.boolean  "isPinned"
    t.integer  "updated_by"
    t.integer  "assign_notification_to"
  end

  create_table "participants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.integer  "gender"
    t.string   "primary_contact_number"
    t.text     "home_address_line_1",           limit: 65535
    t.integer  "status"
    t.integer  "study_id"
    t.date     "date_of_birth"
    t.string   "email"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "last_contacted_by"
    t.datetime "last_contacted_at"
    t.integer  "registeredBy"
    t.datetime "registeredOn"
    t.string   "participants_blinders_id"
    t.string   "recruitment_method"
    t.string   "surname"
    t.string   "preferred_name"
    t.string   "title"
    t.string   "home_address_line_2"
    t.string   "home_address_suburb"
    t.string   "home_address_state"
    t.string   "home_address_postcode"
    t.string   "mailing_address_line_1"
    t.string   "mailing_address_line_2"
    t.string   "mailing_address_suburb"
    t.string   "mailing_address_state"
    t.string   "mailing_address_postcode"
    t.integer  "primary_contact_number_type"
    t.string   "secondary_contact_number"
    t.integer  "secondary_contact_number_type"
    t.integer  "screening_document_id"
  end

  create_table "studies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "study_name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status"
    t.integer  "study_list"
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "study_id"
    t.integer  "visbility"
    t.integer  "status"
    t.text     "comment",     limit: 65535
    t.date     "valid_until"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",  limit: 65535
    t.integer  "contact_user"
    t.string   "group_email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password"
    t.string   "full_name"
    t.string   "email"
    t.string   "contact_number"
    t.integer  "team_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "isApproved"
    t.boolean  "isActive"
    t.boolean  "isAdmin"
    t.boolean  "isSupervisor"
    t.string   "supervisorNameNotAUser"
    t.boolean  "isDenied"
    t.boolean  "isBlinded"
  end

end
