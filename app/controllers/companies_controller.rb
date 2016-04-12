class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new

  end


  def edit
    @company = Company.find_by(id: params[:id])
    @company.phone_numbers.build if @company.phone_numbers.blank?
  end

  def update
    @company = Company.find_by(id: params[:id])
    if @company.update_attributes(company_attributes)
      redirect_to home_index_path
    else
      render 'update'
    end
  end



  private

  def company_attributes
    params.require(:company).permit(:name, phone_numbers_attributes: [:id, :number, :_destroy])
  end


end