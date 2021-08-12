class UserController < ApplicationController
    
    # def create
    #     params[:user][:city] = City.find(params[:user][:city_id])
    #     super
    # end

    # show user with this ID
    def profile
        @user = User.find(params[:id])
    end
    
    # dashboard page
    def dashboard
        # show latest 3 tasks that user hasn't posted and haven't been sourced
        @latest_tasks = Task.where.not(:user_id => current_user.id).where(sourced: [nil, false ]).last(3)
        # show tasks that user has posted that haven't been sourced
        @active_tasks = Task.where(:user_id => current_user.id, sourced: [nil, false])
    end
    
end
