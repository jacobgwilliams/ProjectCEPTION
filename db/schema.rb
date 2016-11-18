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

ActiveRecord::Schema.define(version: 20161118171129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "final_groups", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.integer  "pitch_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_final_groups_on_pitch_id", using: :btree
    t.index ["student_id"], name: "index_final_groups_on_student_id", using: :btree
  end

  create_table "pitch_rankings", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.integer  "pitch_id",   null: false
    t.integer  "ranking",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_pitch_rankings_on_pitch_id", using: :btree
    t.index ["student_id"], name: "index_pitch_rankings_on_student_id", using: :btree
  end

  create_table "pitches", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.boolean  "advancing",  null: false
    t.integer  "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_pitches_on_student_id", using: :btree
  end

  create_table "secret_keys", force: :cascade do |t|
    t.string   "user_key",   default: "2016coyotes"
    t.string   "admin_key",  default: "igeekallweek"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.integer  "pitch_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_votes_on_pitch_id", using: :btree
    t.index ["student_id"], name: "index_votes_on_student_id", using: :btree
  end

end
