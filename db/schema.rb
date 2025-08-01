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

ActiveRecord::Schema[7.2].define(version: 2025_08_01_111326) do
  create_table "ticket_histories", force: :cascade do |t|
    t.integer "ticket_id_id", null: false
    t.integer "user_id_id", null: false
    t.string "action"
    t.string "old_value"
    t.string "new_value"
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ticket_histories", "ticket_ids"
  add_foreign_key "ticket_histories", "user_ids"
  add_foreign_key "tickets", "users", column: "creator_id"
  add_foreign_key "tickets", "users", column: "developer_id"
  add_foreign_key "tickets", "users", column: "qa_id"
end
