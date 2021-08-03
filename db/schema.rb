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

ActiveRecord::Schema.define(version: 2021_08_03_230221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients_task_items", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "item_id", null: false
    t.datetime "completed_date"
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_patients_task_items_on_item_id"
    t.index ["list_id"], name: "index_patients_task_items_on_list_id"
  end

  create_table "patients_task_lists", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "list_id", null: false
    t.datetime "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_patients_task_lists_on_list_id"
    t.index ["patient_id"], name: "index_patients_task_lists_on_patient_id"
  end

  create_table "task_items", force: :cascade do |t|
    t.string "title", default: ""
    t.string "body", default: ""
    t.integer "due", default: 0
    t.integer "status", default: 0
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_task_items_on_list_id"
  end

  create_table "task_lists", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "patients_task_items", "patients_task_lists", column: "list_id"
  add_foreign_key "patients_task_items", "task_items", column: "item_id"
  add_foreign_key "patients_task_lists", "patients"
  add_foreign_key "patients_task_lists", "task_lists", column: "list_id"
  add_foreign_key "task_items", "task_lists", column: "list_id"
end
