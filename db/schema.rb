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

ActiveRecord::Schema.define(version: 2018_12_01_052311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipes_id"
    t.bigint "foods_id"
    t.integer "amount"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foods_id"], name: "index_ingredients_on_foods_id"
    t.index ["recipes_id"], name: "index_ingredients_on_recipes_id"
  end

  create_table "kitchenwares", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_kitchenwares", force: :cascade do |t|
    t.bigint "recipes_id"
    t.bigint "kitchenwares_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kitchenwares_id"], name: "index_recipe_kitchenwares_on_kitchenwares_id"
    t.index ["recipes_id"], name: "index_recipe_kitchenwares_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "elapsed_minutes"
    t.integer "score"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "recipes_id"
    t.integer "position"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipes_id"], name: "index_steps_on_recipes_id"
  end

  add_foreign_key "ingredients", "foods", column: "foods_id"
  add_foreign_key "ingredients", "recipes", column: "recipes_id"
  add_foreign_key "recipe_kitchenwares", "kitchenwares", column: "kitchenwares_id"
  add_foreign_key "steps", "recipes", column: "recipes_id"
end
