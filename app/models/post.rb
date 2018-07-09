class Post < Article
  belongs_to :post_category
  scope :not_future, -> () { where("created_at <= ?", Time.now) }
end
