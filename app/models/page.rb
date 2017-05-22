class Page < Article
  belongs_to :category
  has_many :banners
  validates :url, uniqueness: true
end
