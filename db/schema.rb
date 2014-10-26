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

ActiveRecord::Schema.define(version: 20141026200310) do

  create_table "appointments", force: true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.string   "appointment_time"
    t.string   "appointment_date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "approved_appointments", force: true do |t|
    t.integer  "lecturer_id"
    t.integer  "student_id"
    t.string   "appointment_time"
    t.string   "appointment_date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.integer  "requestor"
    t.integer  "acceptor"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "lecturers", force: true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.string   "available_hrs"
    t.text     "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clid"
  end

  create_table "logins", force: true do |t|
    t.string   "clid"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "clid"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "Adress"
    t.string   "City"
    t.string   "State"
    t.string   "zip_code"
    t.string   "phone"
  end

end
