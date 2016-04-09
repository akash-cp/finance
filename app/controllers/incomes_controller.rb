class IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def index
    @users = company.users

    params[:start_date] = Date.today.beginning_of_month.strftime('%d-%m-%Y') unless params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d-%m-%Y') unless params[:end_date].present?

    @incomes = company.incomes.filter(filter_params(params)).paginate(page: params[:page])
    @income_category_count = @income_categories.joins(:incomes).filter(filter_params(params)).group(:name).count

    respond_to do |format|
      format.html
      format.js
      format.pdf
      format.xls
    end
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.save
    set_category_count
  end

  def edit
    @income_categories = company.income_categories
    @income = Income.find_by(id: params[:id])
  end

  def update
    @income = Income.find_by(id: params[:id])
    @income.update_attributes(income_params)
    @income.update_columns(updated_by: current_user.id)
   set_category_count
  end

  def destroy
    @income = Income.find_by(id: params[:id])
    @income.destroy
    set_category_count
  end


  private
  def income_params
    params.require(:income).permit(:date, :amount, :description, :income_category_id, :created_by, :updated_by, :company_id, :attachment)
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :category_id)
  end

  def set_category
    @income_categories = company.income_categories
  end

  def set_category_count
    @income_category_count = @income_categories.joins(:incomes).group(:name).count
  end

end