class UserController < ApplicationController
    
    # def create
    #     params[:user][:city] = City.find(params[:user][:city_id])
    #     super
    # end

    def profile
        @user = User.find(params[:id])
    end
    
    def dashboard
        @latest_tasks = Task.where.not(:user_id => current_user.id).where(sourced: [nil, false ]).last(3)
        @active_tasks = Task.where(:user_id => current_user.id, sourced: [nil, false])
    end
    
end
