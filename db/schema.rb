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

ActiveRecord::Schema[7.1].define(version: 2025_11_25_094527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_chats_on_users_id"
  end

  create_table "fridges", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_fridges_on_users_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.bigint "fridges_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fridges_id"], name: "index_ingredients_on_fridges_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.string "role"
    t.bigint "chats_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chats_id"], name: "index_messages_on_chats_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "content"
    t.bigint "chats_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chats_id"], name: "index_recipes_on_chats_id"
    t.index ["users_id"], name: "index_recipes_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "allergy"
    t.string "diet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ustensils", force: :cascade do |t|
    t.string "name"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_ustensils_on_users_id"
  end

  add_foreign_key "chats", "users", column: "users_id"
  add_foreign_key "fridges", "users", column: "users_id"
  add_foreign_key "ingredients", "fridges", column: "fridges_id"
  add_foreign_key "messages", "chats", column: "chats_id"
  add_foreign_key "recipes", "chats", column: "chats_id"
  add_foreign_key "recipes", "users", column: "users_id"
  add_foreign_key "ustensils", "users", column: "users_id"
end
