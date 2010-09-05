class RedditsUsers < ActiveRecord::Migration
  def self.up
    create_table :reddits_users, :id => false do |t|
      t.integer :reddit_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :table_name
  end
end
