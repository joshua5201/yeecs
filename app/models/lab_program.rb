class LabProgram < ApplicationRecord
  mount_uploader :img, ImageUploader
  mount_uploader :file, FileUploader

  def url
    file&.url
  end
end
