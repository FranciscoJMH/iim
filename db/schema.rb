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

ActiveRecord::Schema[7.0].define(version: 2023_08_09_232851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.float "price"
    t.bigint "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_articles_on_provider_id"
  end

  create_table "buy_articles", force: :cascade do |t|
    t.bigint "buy_id", null: false
    t.bigint "article_id", null: false
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_buy_articles_on_article_id"
    t.index ["buy_id"], name: "index_buy_articles_on_buy_id"
  end

  create_table "buys", force: :cascade do |t|
    t.float "quantity"
    t.float "iva"
    t.float "total"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["project_id"], name: "index_buys_on_project_id"
    t.index ["user_id"], name: "index_buys_on_user_id"
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.bigint "responsible_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsible_id"], name: "index_enterprises_on_responsible_id"
  end

  create_table "machineries", force: :cascade do |t|
    t.integer "number"
    t.string "code"
    t.string "machine_type"
    t.text "characteristics"
    t.float "cost_iva"
    t.float "freight"
    t.date "init_date"
    t.date "renovation_date"
    t.text "note"
    t.bigint "provider_id", null: false
    t.bigint "enterprise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_machineries_on_enterprise_id"
    t.index ["provider_id"], name: "index_machineries_on_provider_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "social_reason"
    t.string "rfc"
    t.string "telephone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.text "description"
    t.string "brand"
    t.float "caliber"
    t.text "characteristics"
    t.date "buying_date"
    t.date "ingress_date"
    t.bigint "enterprise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_tools_on_enterprise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "providers"
  add_foreign_key "buy_articles", "articles"
  add_foreign_key "buy_articles", "buys"
  add_foreign_key "buys", "projects"
  add_foreign_key "buys", "users"
  add_foreign_key "enterprises", "responsibles"
  add_foreign_key "machineries", "enterprises"
  add_foreign_key "machineries", "providers"
  add_foreign_key "tools", "enterprises"
end
