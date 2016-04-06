class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    # byebug
    @income_categories = company.income_categories.where(company_id: company.id)
    @users = company.users
    @incomes = company.incomes
    if !params[:start_date].nil? and !params[:end_date].nil?
      @incomes = @incomes.range(Date.parse(params[:start_date].to_s), Date.parse(params[:end_date].to_s)) if params[:start_date].first.present? and params[:end_date].first.present?
    end
    @incomes = @incomes.for_user(params[:user_id]) if params[:user_id].present?
    @incomes = @incomes.for_categorincy(params[:category_id]) if params[:category_id].present?
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

end