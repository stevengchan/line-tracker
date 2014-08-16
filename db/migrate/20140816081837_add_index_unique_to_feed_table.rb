class AddIndexUniqueToFeedTable < ActiveRecord::Migration
  def change
    add_index :feeds, :league, unique: true
  end
end