class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      @expense.update_attributes(created_by: current_user.id, updated_by: current_user.id)
      redirect_to expenses_path
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find_by(id: params[:id])
  end

  def update
    @expense = Expense.update_attributes(expense_params)
    if @expense.update_attributes(expense_category_params)
      @expense.update_attributes(updated_by: current_user.id)
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
    params.require(:expense).permit(:date, :amount, :description, :expense_category_id, :created_by, :updated_by)
  end

end