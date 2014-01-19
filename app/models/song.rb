class Song < ActiveRecord::Base
  validates :title, :url_alias, presence: true
  belongs_to :artist

  PerPage = 10
  def self.page(pg)
    pg = pg.to_i
    self.order('title asc').offset((pg-1)*PerPage).limit(PerPage)
  end
 
  def self.pgcount
    count % PerPage == 0 ? count / PerPage : count / PerPage + 1
  end
      
end
