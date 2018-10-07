module AdminAuthenticable
  def authenticate_admin
    authenticate_user!
    unless current_user && current_user.is_admin
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
