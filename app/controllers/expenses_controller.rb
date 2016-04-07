class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expense_categories = company.expense_categories
    @users = company.users

    if params[:start_date].nil?
      params[:start_date] = Date.today.beginning_of_month
      params[:end_date] = Date.today.end_of_month
    else
      params[:start_date] = params[:start_date].first
      params[:end_date] = params[:end_date].first
      params[:start_date] = Date.today.beginning_of_month unless params[:start_date].present?
      params[:end_date] = Date.today.end_of_month unless params[:end_date].present?
    end

    @expenses = company.expenses.filter(filter_params(params))
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find_by(id: params[:id])
  end

  def update
    @expense = Expense.find_by(id: params[:id])
    if @expense.update_attributes(expense_params)
      @expense.update_columns(updated_by: current_user.id)
    else
      render 'update'
    end
  end

  def destroy
    Expense.find_by(id: params[:id]).destroy
    redirect_to expenses_path
  end


  private
  def expense_params
    params.require(:expense).permit(:date, :amount, :description, :expense_category_id, :created_by, :updated_by , :company_id, :attachment)
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :category_id)
  end

end