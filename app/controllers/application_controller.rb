class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    registration_params = [:nombre, :email, :password, :password_confirmation]
    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update){
        |u| u.permit(registration_params << :current_password)
      }
    elseif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sing_out) {
          |u| u.permit(registration_params)
        }
    end
  end

end
