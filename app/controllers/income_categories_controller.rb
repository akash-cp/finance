class IncomeCategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @income_categories = IncomeCategory.all
  end


  def new
    @income_category = IncomeCategory.new
  end

  def create
    @income_category = IncomeCategory.new(income_category_params)
    if @income_category.save
      @income_category.update_attributes(created_by: current_user.id, updated_by: current_user.id)
      redirect_to income_categories_path
    else
      render 'new'
    end
  end

  def edit
    @income_category = IncomeCategory.find_by(id: params[:id])
  end

  def update
    @income_category = IncomeCategory.find_by(id: params[:id])
    if @income_category.update_attributes(income_category_params)
      @income_category.update_attributes(updated_by: current_user.id)
    else
      render 'update'
    end
  end

  def destroy
    @income_category = IncomeCategory.find_by(id: params[:id])
    if @income_category.destroy
      redirect_to income_categories_path
    else
      flash[:notice] = 'Category has Incomes. Category cannot be deleted.'
      redirect_to income_categories_path
    end
  end

  private
  def income_category_params
    params.require(:income_category).permit(:name, :company_id)

  end

end