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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120529135758) do

  create_table "snp_positions", :force => true do |t|
    t.string   "snp_id"
    t.integer  "position"
    t.integer  "chromosome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "snp_positions", ["chromosome"], :name => "index_snp_positions_on_chromosome"

  create_table "strains", :force => true do |t|
    t.string   "name"
    t.integer  "snp_position_id"
    t.text     "allele"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
