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

ActiveRecord::Schema.define(version: 2018_12_19_135225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_wishlists", force: :cascade do |t|
    t.bigint "bar_id"
    t.bigint "user_id"
    t.boolean "is_visited", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_wishlists_on_bar_id"
    t.index ["user_id"], name: "index_bar_wishlists_on_user_id"
  end

  create_table "bars", force: :cascade do |t|
    t.bigint "manager_id"
    t.string "name"
    t.text "address"
    t.string "photo"
    t.text "opening_time"
    t.text "happy_hours"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.boolean "state", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "siret", precision: 14
    t.index ["manager_id"], name: "index_bars_on_manager_id"
  end

  create_table "beer_lists", force: :cascade do |t|
    t.decimal "pint_price"
    t.decimal "half_pint_price"
    t.decimal "bottle_price"
    t.bigint "beer_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_archived", default: false
    t.index ["bar_id"], name: "index_beer_lists_on_bar_id"
    t.index ["beer_id"], name: "index_beer_lists_on_beer_id"
  end

  create_table "beer_wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_beer_wishlists_on_user_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.decimal "abv"
    t.decimal "ibu"
    t.boolean "verified", default: false
    t.bigint "category_id"
    t.bigint "style_id"
    t.bigint "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["category_id"], name: "index_beers_on_category_id"
    t.index ["style_id"], name: "index_beers_on_style_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.boolean "verified", default: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fav_beers", force: :cascade do |t|
    t.bigint "beer_wishlist_id"
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_fav_beers_on_beer_id"
    t.index ["beer_wishlist_id"], name: "index_fav_beers_on_beer_wishlist_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_managers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_styles_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bar_wishlists", "bars"
  add_foreign_key "bar_wishlists", "users"
  add_foreign_key "bars", "managers"
  add_foreign_key "beer_lists", "bars"
  add_foreign_key "beer_lists", "beers"
end
