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

ActiveRecord::Schema.define(version: 20170126160551) do

  create_table "carts", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id",    null: false
    t.integer "quantity"
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text   "description"
    t.string "name"
    t.string "image_url"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.integer  "product_id",       null: false
    t.integer  "user_id",          null: false
    t.integer  "quantity",         null: false
    t.boolean  "is_completed"
    t.text     "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.float   "price",                null: false
    t.integer "quantity",             null: false
    t.integer "ram"
    t.float   "cpu_frequency"
    t.string  "cpu_name"
    t.integer "cpu_model_number"
    t.integer "gpu_vram"
    t.string  "gpu_brand"
    t.integer "gpu_mem_bus_wdith"
    t.integer "gpu_directx"
    t.string  "storage_brand"
    t.boolean "storage_ssd"
    t.integer "storage_size"
    t.integer "storage_rpm"
    t.integer "storage_sata_version"
    t.integer "storage_count"
    t.string  "psu_brand"
    t.integer "psu_power"
    t.integer "psu_efficiency"
    t.integer "psu_amps_12v_rail"
    t.string  "image_url"
    t.integer "category_id"
    t.string  "description"
    t.string  "title"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "password",   null: false
    t.integer  "level",      null: false
    t.string   "email"
    t.string   "gender"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
