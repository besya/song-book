class Song < ActiveRecord::Base
  validates :title, :url_alias, presence: true
  belongs_to :artist
end
