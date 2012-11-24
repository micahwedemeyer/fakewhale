class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username
      t.integer :cached_tweet_id, :limit => 8
      t.text :cached_tweet
      t.datetime :cached_at, :default => "1970-01-01T00:00:00"
      t.timestamps
    end

    add_index :twitter_users, :username, :unique => true
    add_index :twitter_users, [:username, :cached_at]
  end
end
