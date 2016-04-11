class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def index
    authorize Expense
    @users = company.users

    params[:start_date] = Date.today.beginning_of_month.strftime('%d-%m-%Y') unless params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d-%m-%Y') unless params[:end_date].present?

    @expenses = company.expenses.filter(filter_params(params))
    @expense_category_count = @expense_categories.joins(:expenses).filter(filter_params(params)).group(:name).count

    respond_to do |format|
      format.html
      format.js
      format.pdf
      format.xls
    end
  end

  def new
    authorize Expense
    @expense = Expense.new
  end

  def create
    authorize Expense
    @expense = Expense.new(expense_params)
    @expense.save
    set_category_count
  end

  def edit
    authorize Expense
    @expense = Expense.find_by(id: params[:id])
  end

  def update
    authorize Expense
    @expense = Expense.find_by(id: params[:id])
    @expense.update_attributes(expense_params)
    @expense.update_columns(updated_by: current_user.id)
    set_category_count
  end

  def destroy
    authorize Expense
    @expense = Expense.find_by(id: params[:id])
    @expense.destroy
    set_category_count
  end


  private
  def expense_params
    params.require(:expense).permit(:date, :amount, :description, :expense_category_id, :created_by, :updated_by , :company_id, :attachment)
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :category_id)
  end

  def set_category
    @expense_categories = company.expense_categories
  end

  def set_category_count
    @expense_category_count = @expense_categories.joins(:expenses).group(:name).count
  end

end