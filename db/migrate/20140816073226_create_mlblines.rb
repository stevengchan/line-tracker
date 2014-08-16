class CreateMlblines < ActiveRecord::Migration
  def change
    create_table :mlblines do |t|
      t.integer :mlbmatch_id
      t.integer :moneyline_away
      t.integer :moneyline_home
      t.float :spread_away
      t.float :spread_home
      t.integer :spread_adjust_away
      t.integer :spread_adjust_home
      t.float :total
      t.integer :over_adjust
      t.integer :under_adjust

      t.timestamps
    end
  end
end