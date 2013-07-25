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

ActiveRecord::Schema.define(:version => 20130725170026) do

  create_table "functions", :force => true do |t|
    t.string  "name"
    t.integer "body"
  end

  create_table "nodes", :force => true do |t|
    t.string  "kind"
    t.integer "value"
    t.integer "function"
    t.integer "predicate"
    t.integer "true_branch"
    t.integer "false_branch"
    t.string  "arguments"
  end

end
