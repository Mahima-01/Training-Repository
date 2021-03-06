# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_24_081153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.text "name"
    t.integer "cruising_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifieds", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "aircraft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employees_id"
    t.bigint "aircrafts_id"
    t.index ["aircrafts_id"], name: "index_certifieds_on_aircrafts_id"
    t.index ["employees_id"], name: "index_certifieds_on_employees_id"
  end

  create_table "certifieds_employees", id: false, force: :cascade do |t|
    t.bigint "certified_id", null: false
    t.bigint "employee_id", null: false
    t.index ["certified_id", "employee_id"], name: "index_certifieds_employees_on_certified_id_and_employee_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "employees", force: :cascade do |t|
    t.text "name"
    t.integer "salary"
    t.text "phone_number"
    t.date "DOB"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.text "from"
    t.text "destination"
    t.integer "distance"
    t.time "departs"
    t.time "arrives"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "using_change_methods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "certifieds", "aircrafts", column: "aircrafts_id"
  add_foreign_key "certifieds", "employees", column: "employees_id"
end
