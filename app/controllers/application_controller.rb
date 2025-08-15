class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!, unless: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorize

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end
  protected
  def after_sign_in_path_for(resource)
    case resource.role
    when "user"
      user_dashboard_path
    when "developer"
      developer_dashboard_path
    when "qa"
      qa_dashboard_path
    when "admin"
      admin_dashboard_path
    else
      root_path
    end
  end
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :role ])
  end
end
