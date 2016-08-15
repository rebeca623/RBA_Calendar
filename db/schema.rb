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

ActiveRecord::Schema.define(version: 20160813225642) do

  create_table "actions", force: :cascade do |t|
    t.string   "accion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "numpersonas"
    t.date     "fecha"
    t.time     "hora"
    t.text     "comentario"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "case_type_id"
    t.integer  "status_app",   default: 1
    t.integer  "tipocita"
    t.boolean  "attendance"
  end

  add_index "appointments", ["case_type_id"], name: "index_appointments_on_case_type_id"
  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "case_type_id"
  end

  create_table "case_types", force: :cascade do |t|
    t.string   "tipocaso"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "duration_type"
  end

  create_table "case_types_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "case_type_id", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "nombreclt"
    t.string   "apaternoclt"
    t.string   "amaternoclt"
    t.string   "direccion"
    t.string   "emailclt"
    t.string   "telefonoclt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "numcaso"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "colorsec"
    t.boolean  "used"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "action_id"
    t.datetime "fechalog"
    t.integer  "client_id"
    t.text     "detalles"
    t.string   "ubicacion"
  end

  create_table "registries", force: :cascade do |t|
    t.date     "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "color_id",               default: 1,  null: false
    t.integer  "role_id",                default: 4,  null: false
    t.string   "nombre",                 default: "", null: false
    t.string   "apaterno",               default: "", null: false
    t.string   "amaterno"
    t.string   "telefono"
    t.integer  "status",                 default: 1,  null: false
  end

  add_index "users", ["color_id"], name: "index_users_on_color_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

  create_table "vacations", force: :cascade do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
