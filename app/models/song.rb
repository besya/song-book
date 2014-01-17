class Song < ActiveRecord::Base
  validates :title, :alias, presence: true
  belongs_to :artist
end
