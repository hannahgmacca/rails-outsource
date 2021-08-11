class TaskPolicy < ApplicationPolicy
    # Tasks can only be edited / updated by creator or admin
    def created_by_user?
        @record.user_id == user.id
    end
    
    def update?
        user.admin? || created_by_user?
    end

    def destroy?
      user.admin? || created_by_user?
    end
end