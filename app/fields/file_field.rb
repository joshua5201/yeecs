require "administrate/field/base"

class FileField < Administrate::Field::Base
  def to_s
    data&.url or ""
  end
end
