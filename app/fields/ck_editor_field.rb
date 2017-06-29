require "administrate/field/base"

class CkEditorField < Administrate::Field::Base
  def to_s
    data
  end
end
