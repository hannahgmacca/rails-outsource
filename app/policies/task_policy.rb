class TaskPolicy < ApplicationPolicy
  
  def initialize(user, task)
    @user = user
    @task = task
  end

    def created_by_user?
        @task.user_id == user.id
    end
    
    def update?
        user.admin? || created_by_user?
    end
  
    def update?
      user.admin? || created_by_user?
    end

    def destroy?
      user.admin? || created_by_user?
    end
end