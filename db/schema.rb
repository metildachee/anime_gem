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

ActiveRecord::Schema.define(version: 2020_08_03_153112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "age"
    t.string "img_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "manga_id", null: false
    t.string "name"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_characters_on_actor_id"
    t.index ["manga_id"], name: "index_characters_on_manga_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "desc"
  end

  create_table "genres_mangas", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "manga_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_genres_mangas_on_genre_id"
    t.index ["manga_id"], name: "index_genres_mangas_on_manga_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "title"
    t.string "desc"
    t.string "img_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_mangas_on_artist_id"
  end

  add_foreign_key "characters", "actors"
  add_foreign_key "characters", "mangas"
  add_foreign_key "genres_mangas", "genres"
  add_foreign_key "genres_mangas", "mangas"
  add_foreign_key "mangas", "artists"
end
