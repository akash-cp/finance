class ExpensePolicy < ApplicationPolicy

  def index?
    user.company.owner_id == user.id
    false
  end

  def show?

  end

  def new?
    false
  end

  def create?

  end

  def edit?

  end

  def update?

  end

  def destroy?

  end

end