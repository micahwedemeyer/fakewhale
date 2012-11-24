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

ActiveRecord::Schema.define(:version => 20121124142801) do

  create_table "cafepress_items", :force => true do |t|
    t.integer  "tweet_id"
    t.integer  "design_id"
    t.integer  "product_id"
    t.string   "marketplace_uri"
    t.text     "raw_xml"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cafepress_items", ["tweet_id"], :name => "index_cafepress_items_on_tweet_id"

  create_table "retweets", :force => true do |t|
    t.integer  "tweet_id"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "error_message"
    t.string   "external_id"
  end

  create_table "tweets", :force => true do |t|
    t.string   "username"
    t.text     "message"
    t.string   "shorturl"
    t.integer  "views",                                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tweet_html",     :limit => 2147483647
    t.string   "pic_url"
    t.integer  "user_id"
    t.string   "tweet_template"
    t.integer  "flags",                                :default => 0
    t.boolean  "featured",                             :default => false
  end

  add_index "tweets", ["created_at"], :name => "created_at"
  add_index "tweets", ["featured", "created_at"], :name => "index_tweets_on_featured_and_created_at"
  add_index "tweets", ["views"], :name => "index_tweets_on_views"

  create_table "twitter_tokens", :force => true do |t|
    t.string   "request_token"
    t.string   "request_secret"
    t.string   "access_token"
    t.string   "access_secret"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", :force => true do |t|
    t.string   "username"
    t.integer  "twitter_user_id"
    t.integer  "cached_tweet_id", :limit => 8
    t.text     "cached_tweet"
    t.datetime "cached_at",                    :default => '1970-01-01 00:00:00'
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  add_index "twitter_users", ["twitter_user_id"], :name => "index_twitter_users_on_twitter_user_id"
  add_index "twitter_users", ["username", "cached_at"], :name => "index_twitter_users_on_username_and_cached_at"
  add_index "twitter_users", ["username"], :name => "index_twitter_users_on_username", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "avatar"
    t.integer  "twitter_token_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
