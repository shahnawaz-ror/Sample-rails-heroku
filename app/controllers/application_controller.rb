class ApplicationController < ActionController::Base
	 skip_before_action :verify_authenticity_token  

	before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password, :image]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
