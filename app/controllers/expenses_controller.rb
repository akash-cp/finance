class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
    @expense_categories = ExpenseCategory.where(company_id: company.id)
    @users = company.users
    if !params[:start_date].nil? and !params[:end_date].nil?
      @expenses = @expenses.range(Date.parse(params[:start_date].to_s), Date.parse(params[:end_date].to_s)) if params[:start_date].first.present? and params[:end_date].first.present?
    end
    @expenses = @expenses.for_user(params[:user_id]) if params[:user_id].present?
    @expenses = @expenses.for_category(params[:category_id]) if params[:category_id].present?
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

end