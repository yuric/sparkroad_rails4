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

ActiveRecord::Schema.define(version: 20130429012047) do

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

  add_index "accounts", ["authentication_token"], name: "index_accounts_on_authentication_token", unique: true
  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["person_id"], name: "index_accounts_on_person_id"
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  add_index "accounts", ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true

  create_table "group_items", force: true do |t|
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_items", ["group_id"], name: "index_group_items_on_group_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["school_id"], name: "index_groups_on_school_id"

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

  create_table "schools", force: true do |t|
    t.string   "name"
    t.integer  "parent_organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["parent_organization_id"], name: "index_schools_on_parent_organization_id"

  create_table "students", force: true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["person_id"], name: "index_students_on_person_id"

  create_table "studies", force: true do |t|
    t.integer  "school_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studies", ["school_id"], name: "index_studies_on_school_id"
  add_index "studies", ["student_id"], name: "index_studies_on_student_id"

  create_table "teachers", force: true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["account_id"], name: "index_teachers_on_account_id"

  create_table "teaches", force: true do |t|
    t.integer  "group_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teaches", ["group_id"], name: "index_teaches_on_group_id"
  add_index "teaches", ["teacher_id"], name: "index_teaches_on_teacher_id"

  create_table "works", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["school_id"], name: "index_works_on_school_id"
  add_index "works", ["teacher_id"], name: "index_works_on_teacher_id"

end
