require 'mailchimp'

class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :setup_mcapi
 
def setup_mcapi
  @mc = Mailchimp::API.new('03c84cb84788ea735b9b8d9b058c9c7c-us8')
  @list_id = "0c39469fa3"
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :email, :password, :password_confirmation, :current_password) }
  end


end
