class Page < Article
  belongs_to :category
  has_many :banners
  validates_uniqueness_of :url
  validates_presence_of :url
end
