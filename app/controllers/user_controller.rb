class UserController < ApplicationController
    
    def create
        params[:user][:city] = City.find(params[:user][:city_id])
        super
    end

    def profile
        @user = User.find(params[:id])
    end

    def current_user_profile
    end
    
    def dashboard
        @latest_tasks = Task.all_sort_by_date_skip_first
    end
    
    private
    
    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city_id, :city])
    end
end
