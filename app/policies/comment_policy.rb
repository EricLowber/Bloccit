class CommentPolicy < ApplicationPolicy
  
  def edit
   update?
  end

  def destroy
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end 
