class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def t_attr(attr)
    en_atrr = "en_#{attr.to_s}".to_sym
    if I18n.locale != 'zh-TW'.to_sym and send(en_attr).present?
      return send(en_attr)
    else
      return send(attr)
    end
  end
end
