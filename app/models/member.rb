class Member < ApplicationRecord
  belongs_to :member_category
  mount_uploader :image, ImageUploader
end
