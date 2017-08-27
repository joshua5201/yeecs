class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_uniqueness_of :url
  validates_presence_of :url
end
