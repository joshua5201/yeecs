class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def t_title
    if I18n.locale != 'zh-TW' and self.en_title.present?
      return en_title
    else
      return title
    end
  end
end
