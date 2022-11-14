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

<<<<<<< HEAD
<<<<<<< Updated upstream
ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

=======
ActiveRecord::Schema[7.0].define(version: 2022_11_14_062600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "species"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "status"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_bookings_on_animal_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

=======
ActiveRecord::Schema[7.0].define(version: 2022_11_14_052512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

>>>>>>> 8fada36abfcaad816b805eb69be621a9dba19d99
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  add_foreign_key "animals", "users"
  add_foreign_key "bookings", "animals"
  add_foreign_key "bookings", "users"
>>>>>>> Stashed changes
=======
>>>>>>> 8fada36abfcaad816b805eb69be621a9dba19d99
end
