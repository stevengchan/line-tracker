class Mlbmatch < ActiveRecord::Base
  has_many :mlblines, dependent: :destroy
  validates :match_date, presence: true
  validates :rotnum_away, presence: true
  validates :rotnum_home, presence: true
  validates :team_away, presence: true
  validates :team_home, presence: true
  default_scope { order(match_date: :desc) }
end