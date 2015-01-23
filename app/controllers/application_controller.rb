class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
    end

    def after_sign_up_path_for(user)
      user_bookings_path if user.client?
      admin_root_path if user.hotel_admin?
    end

    def after_sign_in_path_for(user)
      user_bookings_path if user.client?
      admin_root_path if user.hotel_admin?
    end

end
