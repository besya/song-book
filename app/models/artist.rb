class Artist < ActiveRecord::Base
  validates :title, :alias, presence: true
  has_many :songs
end
