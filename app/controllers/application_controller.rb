class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception
  before_action :set_navbar_contents

  private

  def set_navbar_contents
    @categories = Category.includes(:pages).order(:id => :asc)
  end
end
