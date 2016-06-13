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

ActiveRecord::Schema.define(version: 20160612192721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.integer  "question_id"
    t.boolean  "correct",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "faculty"
    t.integer  "course_number"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tests", ["user_id"], name: "index_tests_on_user_id", using: :btree

  create_table "user_results", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "user_test_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_results", ["answer_id"], name: "index_user_results_on_answer_id", using: :btree
  add_index "user_results", ["question_id"], name: "index_user_results_on_question_id", using: :btree
  add_index "user_results", ["user_test_id"], name: "index_user_results_on_user_test_id", using: :btree

  create_table "user_tests", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tests", ["test_id"], name: "index_user_tests_on_test_id", using: :btree
  add_index "user_tests", ["user_id"], name: "index_user_tests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.integer  "state",           default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "profiles", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "tests", "users"
  add_foreign_key "user_results", "answers"
  add_foreign_key "user_results", "questions"
  add_foreign_key "user_results", "user_tests"
  add_foreign_key "user_tests", "tests"
  add_foreign_key "user_tests", "users"
end
