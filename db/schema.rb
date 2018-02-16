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

ActiveRecord::Schema.define(version: 20180215223713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "events", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "object_id"
    t.datetime "date"
    t.string "event_name", limit: 100
    t.json "event_data"
    t.string "object_domain", limit: 30
    t.string "object_type", limit: 30
  end

  create_table "short_urls", force: :cascade do |t|
    t.string "code"
    t.string "original_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
