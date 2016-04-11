class ExpenseCategoryPolicy < ApplicationPolicy

  def index?
    user.role.can_view_expense_category if user
  end

  def show?

  end

  def new?
    create?
  end

  def create?
    user.role.can_create_expense_category
  end

  def edit?
    update?
  end

  def update?
    user.role.can_edit_expense_category
  end

  def destroy?
    user.role.can_delete_expense_category
  end

end