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

ActiveRecord::Schema.define(version: 20190129163306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.float    "mark"
    t.integer  "mark_ects"
    t.integer  "presence"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "kind"
    t.integer  "group_id"
    t.integer  "discipline_id"
    t.integer  "semester_id"
    t.integer  "relationship_id"
    t.string   "title"
  end

  add_index "attends", ["user_id"], name: "index_attends_on_user_id", using: :btree
  add_index "attends", ["visit_id"], name: "index_attends_on_visit_id", using: :btree

  create_table "discipline_modules", force: :cascade do |t|
    t.string   "title"
    t.integer  "discipline_id"
    t.integer  "duration"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discipline_modules", ["discipline_id"], name: "index_discipline_modules_on_discipline_id", using: :btree

  create_table "disciplines", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disciplines", ["user_id"], name: "index_disciplines_on_user_id", using: :btree

  create_table "groupings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groupings", ["group_id"], name: "index_groupings_on_group_id", using: :btree
  add_index "groupings", ["user_id"], name: "index_groupings_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
    t.integer  "year"
  end

  add_index "groups", ["status"], name: "index_groups_on_status", using: :btree

  create_table "homeworks", force: :cascade do |t|
    t.text     "comment_text"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "visit_id"
    t.integer  "user_id"
    t.text     "body"
  end

  add_index "homeworks", ["user_id"], name: "index_homeworks_on_user_id", using: :btree
  add_index "homeworks", ["visit_id"], name: "index_homeworks_on_visit_id", using: :btree

  create_table "question_groups", force: :cascade do |t|
    t.string   "title"
    t.integer  "discipline_module_id"
    t.integer  "position"
    t.integer  "points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "question_groups", ["discipline_module_id"], name: "index_question_groups_on_discipline_module_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "description"
    t.integer  "question_group_id"
    t.integer  "kind"
    t.string   "answer"
    t.jsonb    "variants"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "questions", ["question_group_id"], name: "index_questions_on_question_group_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "discipline_id"
    t.integer  "group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "proportions"
  end

  add_index "relationships", ["discipline_id"], name: "index_relationships_on_discipline_id", using: :btree
  add_index "relationships", ["group_id"], name: "index_relationships_on_group_id", using: :btree
  add_index "relationships", ["semester_id"], name: "index_relationships_on_semester_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.integer  "year"
    t.integer  "pos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_modules", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.integer  "status"
    t.jsonb    "questions"
    t.jsonb    "answers"
    t.jsonb    "results"
    t.integer  "total"
    t.datetime "opened_until"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "checked"
    t.jsonb    "right_answers"
  end

  add_index "student_modules", ["user_id"], name: "index_student_modules_on_user_id", using: :btree
  add_index "student_modules", ["visit_id"], name: "index_student_modules_on_visit_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.integer  "group_id",               default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "title"
    t.integer  "relationship_id"
    t.integer  "kind"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "enabled"
    t.integer  "object_id"
  end

  add_index "visits", ["relationship_id"], name: "index_visits_on_relationship_id", using: :btree

  add_foreign_key "attends", "users"
  add_foreign_key "attends", "visits"
  add_foreign_key "disciplines", "users"
  add_foreign_key "groupings", "groups"
  add_foreign_key "groupings", "users"
  add_foreign_key "homeworks", "visits"
  add_foreign_key "relationships", "disciplines"
  add_foreign_key "relationships", "groups"
  add_foreign_key "relationships", "semesters"
  add_foreign_key "visits", "relationships"
end
