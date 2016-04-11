class RolePolicy < ApplicationPolicy

  def index?
    user.role.can_view_role if user
  end

  def show?

  end

  def new?
    create?
  end

  def create?
    user.role.can_create_role
  end

  def edit?
    update?
  end

  def update?
    user.role.can_edit_role
  end

  def destroy?
    user.role.can_delete_role
  end

end