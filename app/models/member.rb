class Member < ApplicationRecord
  has_one :member_department
  belongs_to :member_category
  mount_uploader :image, ImageUploader
end
