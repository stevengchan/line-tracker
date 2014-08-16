# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140816081837) do

  create_table "feeds", force: true do |t|
    t.string   "league"
    t.string   "feedtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["league"], name: "index_feeds_on_league", unique: true

  create_table "mlblines", force: true do |t|
    t.integer  "mlbmatch_id"
    t.integer  "moneyline_away"
    t.integer  "moneyline_home"
    t.float    "spread_away"
    t.float    "spread_home"
    t.integer  "spread_adjust_away"
    t.integer  "spread_adjust_home"
    t.float    "total"
    t.integer  "over_adjust"
    t.integer  "under_adjust"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlblines", ["mlbmatch_id", "created_at"], name: "index_mlblines_on_mlbmatch_id_and_created_at"
  add_index "mlblines", ["moneyline_away", "moneyline_home", "spread_away", "spread_home", "spread_adjust_away", "spread_adjust_home", "total", "over_adjust", "under_adjust"], name: "index_mlblines_unique", unique: true

  create_table "mlbmatches", force: true do |t|
    t.date     "match_date"
    t.datetime "match_time"
    t.integer  "rotnum_away"
    t.integer  "rotnum_home"
    t.string   "team_away"
    t.string   "team_home"
    t.string   "pitcher_away"
    t.string   "pitcher_home"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlbmatches", ["match_date", "rotnum_away", "rotnum_home", "team_away", "team_home"], name: "index_mlbmatches_unique", unique: true

end
