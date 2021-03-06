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

ActiveRecord::Schema.define(version: 20150810055902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "login",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "name",               default: "", null: false
    t.string   "email",              default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "admin_users", ["login"], name: "index_admin_users_on_login", unique: true, using: :btree

  create_table "catalogs_devices", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "unam_stock_number", null: false
    t.integer  "location_id",       null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "catalogs_locations", force: :cascade do |t|
    t.string   "department",  null: false
    t.string   "responsible", null: false
    t.string   "email",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "catalogs_siteviews", force: :cascade do |t|
    t.integer  "contract_id", null: false
    t.datetime "visit_date",  null: false
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "catalogs_suppliers", force: :cascade do |t|
    t.string   "business_name", null: false
    t.string   "contact",       null: false
    t.string   "phone",         null: false
    t.string   "email",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "system_contracts", force: :cascade do |t|
    t.integer  "device_id",   null: false
    t.integer  "supplier_id", null: false
    t.date     "start_date",  null: false
    t.date     "end_date",    null: false
    t.string   "contract_no", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "catalogs_devices", "catalogs_locations", column: "location_id"
  add_foreign_key "catalogs_siteviews", "system_contracts", column: "contract_id"
  add_foreign_key "system_contracts", "catalogs_devices", column: "device_id"
  add_foreign_key "system_contracts", "catalogs_suppliers", column: "supplier_id"
end
