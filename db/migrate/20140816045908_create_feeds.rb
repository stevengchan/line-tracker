class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :league
      t.string :feedtime

      t.timestamps
    end
  end
end