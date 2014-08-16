class CreateMlbmatches < ActiveRecord::Migration
  def change
    create_table :mlbmatches do |t|
      t.date :match_date
      t.datetime :match_time
      t.integer :rotnum_away
      t.integer :rotnum_home
      t.string :team_away
      t.string :team_home
      t.string :pitcher_away
      t.string :pitcher_home
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