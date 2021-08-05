class ApplicationController < ActionController::Base
    # Pundit Gem for resource authoritsation
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    # User authentication
    protect_from_forgery with: :exception
    before_action :authenticate_user!, :except => [:index]

    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected

    
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :surname, :email, :password, :city_id, :picture)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :surname, :email, :password, :current_password, :city_id, :picture)}
    end
end
