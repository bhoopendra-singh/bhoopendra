class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :check_params, only:[:create]
  protected

  def check_params
    byebug
  	if devise_controller? && params[:controller] == "devise/sessions" && params[:action] == "create"
  		if current_user.cart.cart_items.present?
  			session[:items] = 'true'
  	  end
  	end
  end	
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :contact_no])
  end
end
