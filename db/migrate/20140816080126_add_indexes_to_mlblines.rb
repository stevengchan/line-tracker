class AddIndexesToMlblines < ActiveRecord::Migration
  def change
    add_index :mlblines, [:mlbmatch_id, :created_at]
    add_index :mlblines, [:moneyline_away, :moneyline_home, :spread_away, :spread_home, :spread_adjust_away, :spread_adjust_home, :total, :over_adjust, :under_adjust], name: 'index_mlblines_unique', unique: true
  end
end