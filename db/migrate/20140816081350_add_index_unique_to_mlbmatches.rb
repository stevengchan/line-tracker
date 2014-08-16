class AddIndexUniqueToMlbmatches < ActiveRecord::Migration
  def change
    add_index :mlbmatches, [:match_date, :rotnum_away, :rotnum_home, :team_away, :team_home], name: 'index_mlbmatches_unique', unique: true
  end
end