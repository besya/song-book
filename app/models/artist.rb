class Artist < ActiveRecord::Base
  validates :title, :url_alias, presence: true
  has_many :songs
end
