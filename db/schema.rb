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

ActiveRecord::Schema.define(version: 2021_12_19_215253) do

  create_table "cars", force: :cascade do |t|
    t.string "person", null: false
    t.string "reg_addr_koatuu"
    t.string "oper_code"
    t.string "oper_name"
    t.string "d_reg"
    t.string "dep_code"
    t.string "dep"
    t.string "brand"
    t.string "model"
    t.string "vin", null: false
    t.integer "make_year"
    t.string "color"
    t.string "kind"
    t.string "body"
    t.string "purpose"
    t.string "fuel"
    t.integer "capacity", null: false
    t.integer "own_weight", null: false
    t.integer "total_weight", null: false
    t.string "n_reg_new", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
