class Feed < ActiveRecord::Base
  validates :league, presence: true
  validates :feedtime, presence: true
end