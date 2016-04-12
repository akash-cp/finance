class IncomeCategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize IncomeCategory
    @income_categories = IncomeCategory.all
  end


  def new
    authorize IncomeCategory
    @income_category = IncomeCategory.new
  end

  def create
    authorize IncomeCategory
    @income_category = IncomeCategory.new(income_category_params)
    @income_category.save
  end

  def edit
    authorize IncomeCategory
    @income_category = IncomeCategory.find_by(id: params[:id])
  end

  def update
    authorize IncomeCategory
    @income_category = IncomeCategory.find_by(id: params[:id])
    @income_category.update_attributes(income_category_params)
    @income_category.update_attributes(updated_by: current_user.id)
  end

  def destroy
    authorize IncomeCategory
    @income_category = IncomeCategory.find_by(id: params[:id])
    @income_category.destroy
  end

  private
  def income_category_params
    params.require(:income_category).permit(:name, :company_id, :created_by, :updated_by)
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

end