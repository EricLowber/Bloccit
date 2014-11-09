class CommentPolicy < ApplicationPolicy
  
  def edit
   update?
  end

  def destroy?
    user.present? && can_moderate?(user,record)
  end
end 
