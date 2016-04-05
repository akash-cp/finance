class IncomesController < ApplicationController

  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      @income.update_attributes(created_by: current_user.id, updated_by: current_user.id)
      redirect_to incomes_path
    else
      render 'new'
    end
  end

  def edit
    @income = Income.find_by(id: params[:id])
  end

  def update
    @income = Income.update_attributes(income_params)
    if @income.update_attributes(income_category_params)
      @income.update_attributes(updated_by: current_user.id)
    else
      render 'update'
    end
  end

  def destroy
    Income.find_by(id: params[:id]).destroy
    redirect_to incomes_path
  end


  private
  def income_params
    params.require(:income).permit(:date, :amount, :description, :income_category_id, :created_by, :updated_by)
  end

end