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
    @expense_category.save
  end

  def edit
    @expense_category = ExpenseCategory.find_by(id: params[:id])
  end

  def update
    @expense_category = ExpenseCategory.find_by(id: params[:id])
    @expense_category.update_attributes(expense_category_params)
    @expense_category.update_attributes(updated_by: current_user.id)
  end

  def destroy
    @expense_category =  ExpenseCategory.find_by(id: params[:id])
    @expense_category.destroy
  end

  private
  def expense_category_params
    params.require(:expense_category).permit(:name, :company_id, :created_by, :updated_by)
  end

end