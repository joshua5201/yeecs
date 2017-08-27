class Member < ApplicationRecord
  belongs_to :member_category, optional: true
  belongs_to :member_department, optional: true
  mount_uploader :image, ImageUploader
end
