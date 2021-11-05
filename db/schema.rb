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

ActiveRecord::Schema.define(version: 2021_10_26_235124) do

  create_table "completed_cares", force: :cascade do |t|
    t.string "tally"
    t.integer "self_cares_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["self_cares_id"], name: "index_completed_cares_on_self_cares_id"
    t.index ["user_id"], name: "index_completed_cares_on_user_id"
  end

  create_table "finances", force: :cascade do |t|
    t.integer "amount"
    t.string "flow"
    t.date "date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_finances_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "goal"
    t.text "more_info"
    t.boolean "priority"
    t.date "date"
    t.boolean "completed"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "gratitudes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gratitudes_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "type"
    t.date "date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.date "date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "self_cares", force: :cascade do |t|
    t.string "label"
    t.integer "goal"
    t.string "frequency"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_self_cares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "completed_cares", "self_cares", column: "self_cares_id"
  add_foreign_key "completed_cares", "users"
  add_foreign_key "finances", "users"
  add_foreign_key "foods", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "gratitudes", "users"
  add_foreign_key "invitations", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "self_cares", "users"
end
