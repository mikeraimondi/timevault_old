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

ActiveRecord::Schema.define(:version => 20130521171019) do

  create_table "commits", :force => true do |t|
    t.string   "sha1",          :null => false
    t.integer  "repository_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "intervals", :force => true do |t|
    t.datetime "start",       :null => false
    t.datetime "end"
    t.integer  "pomodoro_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pomodoros", :force => true do |t|
    t.integer  "duration",   :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url",        :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_commits", :force => true do |t|
    t.integer  "task_id"
    t.integer  "commit_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "start",       :null => false
    t.datetime "end"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "commits", "repositories", :name => "commits_repository_id_fk"

  add_foreign_key "intervals", "pomodoros", :name => "intervals_pomodoro_id_fk"

  add_foreign_key "pomodoros", "users", :name => "pomodoros_user_id_fk"

  add_foreign_key "repositories", "users", :name => "repositories_user_id_fk"

  add_foreign_key "task_commits", "commits", :name => "task_commits_commit_id_fk"
  add_foreign_key "task_commits", "tasks", :name => "task_commits_task_id_fk"

  add_foreign_key "tasks", "users", :name => "tasks_user_id_fk"

end
