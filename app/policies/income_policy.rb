class IncomePolicy < ApplicationPolicy

  def index?
    user.role.can_view_income if user
  end

  def show?

  end

  def new?
    create?
  end

  def create?
    user.role.can_create_income
  end

  def edit?
    update?
  end

  def update?
    user.role.can_edit_income
  end

  def destroy?
    user.role.can_delete_income
  end

end