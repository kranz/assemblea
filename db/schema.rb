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

ActiveRecord::Schema.define(:version => 20130501064716) do

  create_table "assemblee", :force => true do |t|
    t.string   "nome"
    t.date     "data"
    t.string   "stato"
    t.string   "eliminato"
    t.string   "presidente"
    t.time     "orainizio"
    t.time     "orafine"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sezione_id"
    t.boolean  "generale"
    t.string   "sede"
  end

  create_table "delegati", :force => true do |t|
    t.string   "socio"
    t.string   "codsocio"
    t.string   "codtessera"
    t.date     "datanascita"
    t.string   "sezione"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "presenze", :force => true do |t|
    t.integer  "socio_id"
    t.string   "isdelegato"
    t.string   "presente"
    t.integer  "assemblea_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "delegato_id"
    t.string   "condelega"
  end

  create_table "sezioni", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "soci", :force => true do |t|
    t.string   "socio"
    t.string   "codsocio"
    t.string   "codtessera"
    t.date     "datanascita"
    t.string   "sezione"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "soci", ["codtessera"], :name => "index_soci_on_codtessera"
  add_index "soci", ["sezione"], :name => "index_soci_on_sezione"
  add_index "soci", ["socio"], :name => "index_soci_on_socio"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "username",               :default => "", :null => false
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
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
