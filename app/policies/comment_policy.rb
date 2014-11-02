class CommentPolicy < ApplicationPolicy
  def create 
    user.present?
  end
  
  def edit
    user.present?
  end
end 
