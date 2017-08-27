class PostCategory < ApplicationRecord
  has_many :posts
  validates_uniqueness_of :url
  validates_presence_of :url
end
