class PhoneNumbersController < ApplicationController

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number =  PhoneNumber.new(phone_number_params)
    if @phone_number.save
      redirect_to home_index_path
    else
      render 'new'
    end

  end

  def edit
    @phone_number = PhoneNumber.find_by(id: params[:id])
  end

  def update
    @phone_number = PhoneNumber.find_by(id: params[:id])
    if @phone_number.update_attributes(phone_number_params)
      redirect_to home_index_path
    else
      render 'update'
    end
  end

  def destroy
    @phone_number = PhoneNumber.find_by(id: params[:id])
    @phone_number.destroy
  end


  private
  def phone_number_params
    params.require(:company).permit(:phone_number)
  end

end