class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :not_hidden, -> {
    if I18n.locale != 'zh-TW'.to_sym
      where(en_hidden: false)
    else
      where(hidden: false)
    end
  }

  def locale_not_zh
    I18n.locale != 'zh-TW'.to_sym
  end

  def t_attr(attr)
    en_attr = "en_#{attr.to_s}".to_sym
    if locale_not_zh && respond_to?(en_attr) && send(en_attr).present?
      return send(en_attr)
    else
      return send(attr)
    end
  end
end
