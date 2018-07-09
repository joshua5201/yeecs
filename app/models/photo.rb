class Photo < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :album, touch: true
end
