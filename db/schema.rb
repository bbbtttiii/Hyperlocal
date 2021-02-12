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

ActiveRecord::Schema.define(version: 2021_02_12_155048) do

  create_table "reports", force: :cascade do |t|
    t.float "temperature"
    t.float "pressure"
    t.float "wind_speed"
    t.string "wind_direction"
    t.integer "relative_humidity"
    t.float "precipitation"
    t.integer "cloud_cover"
    t.string "cloud_type"
    t.string "current_conditions"
    t.string "location"
    t.string "wind_unit"
    t.string "temp_unit"
    t.string "pressure_unit"
    t.string "precip_unit"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
