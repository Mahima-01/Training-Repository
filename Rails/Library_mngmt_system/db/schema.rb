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

ActiveRecord::Schema[7.0].define(version: 2022_07_27_101955) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.bigint "subcategory_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["subcategory_id"], name: "index_books_on_subcategory_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fines", force: :cascade do |t|
    t.decimal "amount"
    t.boolean "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "issue_returns_id"
    t.bigint "student_id"
    t.index ["issue_returns_id"], name: "index_fines_on_issue_returns_id"
    t.index ["student_id"], name: "index_fines_on_student_id"
  end

  create_table "issue_returns", force: :cascade do |t|
    t.datetime "issue_time"
    t.datetime "return_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "student_id"
    t.index ["book_id"], name: "index_issue_returns_on_book_id"
    t.index ["student_id"], name: "index_issue_returns_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.string "address"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "subcategories"
  add_foreign_key "fines", "issue_returns", column: "issue_returns_id"
  add_foreign_key "fines", "students"
  add_foreign_key "issue_returns", "books"
  add_foreign_key "issue_returns", "students"
  add_foreign_key "subcategories", "categories"
end
