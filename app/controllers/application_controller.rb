class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception
  before_action :set_navbar_contents
  before_action :override_locale

  private

  def override_locale
    default = I18n.locale
    begin
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale]
    rescue I18n::InvalidLocale
      session[:locale] = nil
      I18n.locale = default
    end
  end

  def set_navbar_contents
    @categories = Category.includes(:pages).order(:id => :asc)
  end
end
