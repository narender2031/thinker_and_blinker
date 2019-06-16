class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception, prepend: true
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
