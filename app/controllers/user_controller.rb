class UserController < ApplicationController
    
    def create
        params[:user][:city] = City.find(params[:user][:city_id])
        super
    end

    def profile_url
    end

    private
    
    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city_id, :city])
    end
end
