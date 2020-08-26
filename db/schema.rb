# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_105935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "opinions", force: :cascade do |t|
    t.text "text"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_opinions_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "photo", default: "https://source.unsplash.com/random/60x60"
    t.string "cover_image", default: "https://source.unsplash.com/random/600x250"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "opinions", "users", column: "author_id"
end
