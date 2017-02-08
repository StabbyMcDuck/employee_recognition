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

ActiveRecord::Schema.define(version: 20170208050757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string   "awardtype"
    t.string   "employeeename"
    t.string   "employeeemail"
    t.datetime "datecreated"
    t.string   "grantedby"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_awards_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "email",             null: false
    t.string   "crypted_password",  null: false
    t.string   "password_salt",     null: false
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "role"
  end

  add_foreign_key "awards", "users"
end
