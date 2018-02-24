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

ActiveRecord::Schema.define(version: 20180223020919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "cnpj"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
  end

  create_table "company_currencies", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "currency_id"
    t.integer "decimal_places"
    t.index ["company_id", "currency_id"], name: "index_company_currencies_on_company_id_and_currency_id", unique: true
    t.index ["company_id"], name: "index_company_currencies_on_company_id"
    t.index ["currency_id"], name: "index_company_currencies_on_currency_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "product_prices", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "currency_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_product_prices_on_currency_id"
    t.index ["product_id"], name: "index_product_prices_on_product_id"
  end

  create_table "product_subscribers", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "product_price_id"
    t.boolean "is_manager"
    t.boolean "is_payer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_product_subscribers_on_company_id"
    t.index ["product_price_id"], name: "index_product_subscribers_on_product_price_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "name"], name: "index_products_on_company_id_and_name", unique: true
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  add_foreign_key "company_currencies", "companies"
  add_foreign_key "company_currencies", "currencies"
  add_foreign_key "product_prices", "currencies"
  add_foreign_key "product_prices", "products"
  add_foreign_key "product_subscribers", "companies"
  add_foreign_key "product_subscribers", "product_prices"
  add_foreign_key "products", "companies"
end
