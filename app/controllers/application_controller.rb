class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception
  before_action :override_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_navbar_contents

  protected

  def get_resource_by_url_or_id(resource)
    resource.find_by!((params[:id].to_i.positive? ? :id : :url) => params[:id])
  end

  protected

  def authenticate_admin
    authenticate_user!
    unless current_user && current_user.is_admin
      raise ActionController::RoutingError.new('Not Found')
    end
  end

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
    @categories = Category.includes(:pages).not_hidden.order(:rank => :asc)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :student_no, :grade])
  end
end
