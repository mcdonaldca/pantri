# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160214183422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "fruits_serv"
    t.integer  "vegetables_serv"
    t.integer  "grains_serv"
    t.integer  "dairy_serv"
    t.integer  "protein_serv"
    t.integer  "calories"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "fiber"
    t.integer  "protein"
    t.integer  "sodium"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "sugars"
    t.integer  "user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "in_fridge",  default: true
    t.integer  "exp_days",   default: -1
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.float    "servings"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pairs", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "fruit_serving"
    t.boolean  "grain_serving"
    t.boolean  "protein_serving"
    t.boolean  "dairy_serving"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "category"
    t.boolean  "vegetable_serving"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "calorie_goal"
    t.integer  "protein_goal"
    t.integer  "carbs_goal"
    t.integer  "fiber_goal"
    t.integer  "sugars_goal"
    t.integer  "fat_goal"
    t.integer  "sodium_goal"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "fruits_serv_goal"
    t.integer  "protein_serv_goal"
    t.integer  "grains_serv_goal"
    t.integer  "dairy_serv_goal"
    t.integer  "vegetables_serv_goal"
  end

end
