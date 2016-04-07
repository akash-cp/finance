class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @income_categories = company.income_categories
    @users = company.users

    params[:start_date] = Date.today.beginning_of_month.strftime('%d-%m-%Y') unless params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d-%m-%Y') unless params[:end_date].present?

    @incomes = company.incomes.filter(filter_params(params))
    respond_to do |format|
      format.html
      format.pdf
      format.xls
    end
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
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
      @income.update_columns(updated_by: current_user.id)
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
    params.require(:income).permit(:date, :amount, :description, :income_category_id, :created_by, :updated_by, :company_id, :attachment)
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :category_id)
  end

end