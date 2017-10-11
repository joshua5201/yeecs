class Member < ApplicationRecord
  belongs_to :member_category, optional: true
  belongs_to :member_department, optional: true
  mount_uploader :image, ImageUploader

  def t_title_with_name
    if locale_not_zh
      "#{t_attr(:title)} #{t_attr(:name)}"
    else
      "#{name} #{title}"
    end
  end
end
