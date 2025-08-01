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

ActiveRecord::Schema[7.2].define(version: 2025_08_01_144848) do
  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "user_id_id", null: false
    t.integer "ticket_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id_id"], name: "index_comments_on_ticket_id_id"
    t.index ["user_id_id"], name: "index_comments_on_user_id_id"
  end

  create_table "ticket_histories", force: :cascade do |t|
    t.integer "ticket_id_id", null: false
    t.integer "user_id_id", null: false
    t.string "action", null: false
    t.string "old_value", null: false
    t.string "new_value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id_id"], name: "index_ticket_histories_on_ticket_id_id"
    t.index ["user_id_id"], name: "index_ticket_histories_on_user_id_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "status", null: false
    t.integer "creator_id"
    t.integer "developer_id"
    t.integer "qa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_tickets_on_creator_id"
    t.index ["developer_id"], name: "index_tickets_on_developer_id"
    t.index ["qa_id"], name: "index_tickets_on_qa_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "tickets", column: "ticket_id_id"
  add_foreign_key "comments", "users", column: "user_id_id"
  add_foreign_key "ticket_histories", "tickets", column: "ticket_id_id"
  add_foreign_key "ticket_histories", "users", column: "user_id_id"
  add_foreign_key "tickets", "users", column: "creator_id"
  add_foreign_key "tickets", "users", column: "developer_id"
  add_foreign_key "tickets", "users", column: "qa_id"
end
