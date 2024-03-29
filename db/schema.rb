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

ActiveRecord::Schema[7.0].define(version: 2023_08_20_112309) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subtasks", force: :cascade do |t|
    t.string "content"
    t.boolean "completion", default: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_subtasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "content"
    t.string "name"
    t.date "due_date"
    t.integer "importance", default: 1
    t.string "reason"
    t.boolean "completion", default: false
    t.text "content_original"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority"
  end

  add_foreign_key "subtasks", "tasks"
end
