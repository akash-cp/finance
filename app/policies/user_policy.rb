class UserPolicy < ApplicationPolicy

  def index?
    user.role.can_view_user if user
  end

  def show?
    false
  end

  def new?
    create?
  end

  def create?
    user.role.can_invite_user
  end

  def edit?
    update?
  end

  def update?
    user.role.can_edit_user
  end

  def destroy?
    user.role.can_delete_user
  end

end