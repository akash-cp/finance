class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expense_categories = company.expense_categories
    @users = company.users

    params[:start_date] = Date.today.beginning_of_month.strftime('%d-%m-%Y') unless params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d-%m-%Y') unless params[:end_date].present?

    @expenses = company.expenses.filter(filter_params(params))
    @expense_category_count = @expense_categories.joins(:expenses).group(:name).count

    respond_to do |format|
      format.html
      format.pdf
      format.xls
    end
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