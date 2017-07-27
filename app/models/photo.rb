class Photo < ApplicationRecord
  mount_uploader :file, ImageUploader
end
