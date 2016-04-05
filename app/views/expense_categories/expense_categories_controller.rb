class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expense_categories = ExpenseCategory.all
  end


  def new
    @expense_category = ExpenseCategory.new
  end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    if @expense_category.save
      @expense_category.update_attributes(created_by: current_user.id, updated_by: current_user.id)
      redirect_to expense_categories_path
    else
      render 'new'
    end
  end

  def edit
    @expense_category = ExpenseCategory.find_by(id: params[:id])
  end

  def update
    @expense_category = ExpenseCategory.find_by(id: params[:id])
    if @expense_category.update_attributes(expense_params)
      @expense_category.update_attributes(updated_by: current_user.id)
    else
      render 'update'
    end
  end

  def destroy
    @expense_category.find_by(id: params[:id]).destroy
  end

  private
  def expense_category_params
    params.require(:expense_category).permit(:name, :company_id)

  end

end