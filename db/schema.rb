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

ActiveRecord::Schema.define(version: 20140624135726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_edges", force: true do |t|
    t.integer  "parent_answer_id"
    t.integer  "child_answer_id"
    t.integer  "answer_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "direct"
    t.integer  "count"
  end

  create_table "answer_options", force: true do |t|
    t.decimal  "numeric_value"
    t.string   "text_value_en"
    t.datetime "time_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text_value_es"
  end

  create_table "answer_sessions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_flow_id"
    t.integer  "first_answer_id"
    t.integer  "last_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answer_types", force: true do |t|
    t.string   "name"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answer_values", force: true do |t|
    t.integer  "answer_id"
    t.integer  "answer_option_id"
    t.decimal  "numeric_value"
    t.string   "text_value"
    t.datetime "time_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "answer_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailing_lists", force: true do |t|
    t.string   "email",      default: "", null: false
    t.string   "country"
    t.string   "state"
    t.string   "zip_code"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_answer_options", force: true do |t|
    t.integer  "question_id"
    t.integer  "answer_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_edges", force: true do |t|
    t.integer  "question_flow_id"
    t.integer  "parent_question_id"
    t.integer  "child_question_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "direct"
    t.integer  "count"
  end

  create_table "question_flows", force: true do |t|
    t.string   "name_en"
    t.text     "description_en"
    t.integer  "first_question_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_es"
    t.text     "description_es"
    t.text     "tsorted_edges"
    t.decimal  "longest_time"
    t.integer  "longest_path"
  end

  create_table "question_help_messages", force: true do |t|
    t.text     "message_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message_es"
  end

  create_table "question_types", force: true do |t|
    t.string   "name"
    t.string   "tag"
    t.string   "input_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "store_raw_value"
    t.boolean  "allow_multiple"
  end

  create_table "questions", force: true do |t|
    t.text     "text_en"
    t.integer  "question_type_id"
    t.integer  "question_help_message_id"
    t.integer  "answer_type_id"
    t.integer  "unit_id"
    t.decimal  "time_estimate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "graph_id"
    t.text     "text_es"
  end

  create_table "units", force: true do |t|
    t.string   "name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_es"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "year_of_birth"
    t.string   "zip_code"
    t.datetime "accepted_consent_at"
    t.datetime "accepted_pledge_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "theme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
