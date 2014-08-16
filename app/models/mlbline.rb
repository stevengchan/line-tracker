class Mlbline < ActiveRecord::Base
  belongs_to :mlbmatch
  validates :moneyline_away, presence: true
  validates :moneyline_home, presence: true
  validates :spread_away, presence: true
  validates :spread_home, presence: true
  validates :spread_adjust_away, presence: true
  validates :spread_adjust_home, presence: true
  validates :total, presence: true
  validates :over_adjust, presence: true
  validates :under_adjust, presence: true
end