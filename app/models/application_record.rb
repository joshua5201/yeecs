class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def t_title
    if I18n.locale == 'zh-TW'
      return title
    else
      return en_title
    end
  end
end
