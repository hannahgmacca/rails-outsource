class TaskApplicationPolicy < ApplicationPolicy
  
    def created_by_user?
        record.user_id == user.id
    end

    def sent_to_user?
        record.task_id.user_id == user.id
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