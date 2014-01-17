class Artist < ActiveRecord::Base
  validates :title, :alias, presence: true
end
