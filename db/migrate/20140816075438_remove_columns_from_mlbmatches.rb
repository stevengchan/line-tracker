class RemoveColumnsFromMlbmatches < ActiveRecord::Migration
  def change
    remove_column :mlbmatches, :moneyline_away
    remove_column :mlbmatches, :moneyline_home
    remove_column :mlbmatches, :spread_away
    remove_column :mlbmatches, :spread_home
    remove_column :mlbmatches, :spread_adjust_away
    remove_column :mlbmatches, :spread_adjust_home
    remove_column :mlbmatches, :total
    remove_column :mlbmatches, :over_adjust
    remove_column :mlbmatches, :under_adjust
  end
end