class ExpensePolicy < ApplicationPolicy

  def index?
    user.role.can_view_expense if user
  end

  def show?

  end

  def new?
    create?
  end

  def create?
    user.role.can_create_expense
  end

  def edit?
    update?
  end

  def update?
    user.role.can_edit_expense
  end

  def destroy?
    user.role.can_delete_expense
  end

end