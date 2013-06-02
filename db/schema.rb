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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130602110258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "accounts", ["authentication_token"], name: "index_accounts_on_authentication_token", unique: true, using: :btree
  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["person_id"], name: "index_accounts_on_person_id", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "accounts", ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true, using: :btree

  create_table "broadcast_items", force: true do |t|
    t.integer  "broadcast_id"
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "broadcast_items", ["broadcast_id"], name: "index_broadcast_items_on_broadcast_id", using: :btree
  add_index "broadcast_items", ["group_id"], name: "index_broadcast_items_on_group_id", using: :btree
  add_index "broadcast_items", ["student_id"], name: "index_broadcast_items_on_student_id", using: :btree

  create_table "broadcast_media", force: true do |t|
    t.string   "name",        limit: 20, null: false
    t.string   "description",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broadcast_messages", force: true do |t|
    t.integer  "broadcast_id"
    t.integer  "broadcast_media_id"
    t.boolean  "all_media",          default: false, null: false
    t.text     "english_message"
    t.text     "spanish_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "broadcast_messages", ["broadcast_id"], name: "index_broadcast_messages_on_broadcast_id", using: :btree
  add_index "broadcast_messages", ["broadcast_media_id"], name: "index_broadcast_messages_on_broadcast_media_id", using: :btree

  create_table "broadcasts", force: true do |t|
    t.string   "title",      limit: 100, null: false
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "broadcasts", ["school_id"], name: "index_broadcasts_on_school_id", using: :btree

  create_table "parent_organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_group_item_versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "parent_id"
  end

  add_index "school_group_item_versions", ["item_type", "item_id"], name: "index_school_group_item_versions_on_item_type_and_item_id", using: :btree

  create_table "school_group_items", force: true do |t|
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id",  null: false
    t.integer  "person_id"
  end

  add_index "school_group_items", ["group_id"], name: "index_school_group_items_on_group_id", using: :btree
  add_index "school_group_items", ["parent_id"], name: "index_school_group_items_on_parent_id", using: :btree
  add_index "school_group_items", ["person_id"], name: "index_school_group_items_on_person_id", using: :btree

  create_table "school_group_versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "school_group_versions", ["item_type", "item_id"], name: "index_school_group_versions_on_item_type_and_item_id", using: :btree

  create_table "school_groups", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_groups", ["school_id"], name: "index_school_groups_on_school_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.integer  "parent_organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["parent_organization_id"], name: "index_schools_on_parent_organization_id", using: :btree

  create_table "students", force: true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["person_id"], name: "index_students_on_person_id", using: :btree

  create_table "studies", force: true do |t|
    t.integer  "school_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studies", ["school_id"], name: "index_studies_on_school_id", using: :btree
  add_index "studies", ["student_id"], name: "index_studies_on_student_id", using: :btree

  create_table "teachers", force: true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["account_id"], name: "index_teachers_on_account_id", using: :btree

  create_table "teaches", force: true do |t|
    t.integer  "group_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teaches", ["group_id"], name: "index_teaches_on_group_id", using: :btree
  add_index "teaches", ["teacher_id"], name: "index_teaches_on_teacher_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "works", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["school_id"], name: "index_works_on_school_id", using: :btree
  add_index "works", ["teacher_id"], name: "index_works_on_teacher_id", using: :btree

end
