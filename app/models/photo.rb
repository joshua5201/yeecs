class Photo < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :album
end
