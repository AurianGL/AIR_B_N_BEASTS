ActiveRecord::Schema.define(version: 2019_08_19_153447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beasts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.integer "dangerosity"
    t.integer "price"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_beasts_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "status"
    t.bigint "beast_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beast_id"], name: "index_bookings_on_beast_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beasts", "users"
end
