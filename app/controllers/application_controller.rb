class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :family_name, :first_name, :family_name_yomi, :first_name_yomi, :date_of_birth])
  end
end
