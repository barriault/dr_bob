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

ActiveRecord::Schema.define(version: 20161028185435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.float    "calories"
    t.float    "protein"
    t.float    "carbs"
    t.float    "fat"
    t.float    "fiber"
    t.float    "si_dimension"
    t.string   "si_units"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["brand"], name: "index_food_items_on_brand", using: :btree
    t.index ["name"], name: "index_food_items_on_name", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "food_item_id"
    t.integer  "measurement_id"
    t.float    "quantity"
    t.string   "prep"
    t.float    "calories"
    t.float    "protein"
    t.float    "carbs"
    t.float    "fat"
    t.float    "fiber"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["food_item_id"], name: "index_ingredients_on_food_item_id", using: :btree
    t.index ["measurement_id"], name: "index_ingredients_on_measurement_id", using: :btree
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree
  end

  create_table "measurements", force: :cascade do |t|
    t.integer  "food_item_id"
    t.string   "singular_name"
    t.string   "prep"
    t.float    "calories"
    t.float    "protein"
    t.float    "carbs"
    t.float    "fat"
    t.float    "fiber"
    t.float    "si_dimension"
    t.string   "si_units"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["food_item_id"], name: "index_measurements_on_food_item_id", using: :btree
    t.index ["singular_name"], name: "index_measurements_on_singular_name", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "instructions"
    t.float    "calories"
    t.float    "protein"
    t.float    "carbs"
    t.float    "fat"
    t.float    "fiber"
    t.float    "servings"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["title"], name: "index_recipes_on_title", using: :btree
  end

  add_foreign_key "ingredients", "food_items"
  add_foreign_key "ingredients", "measurements"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "measurements", "food_items"
end
