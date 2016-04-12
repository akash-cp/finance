class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @invited_for_company = User.where(company_id: @user.company_id)
  end

  def show
  @user = User.find_by(id: params[:id])
  end


  def create


  end


  def edit

  end


  def update

  end

  def destroy

  end


  def set_user
    @user = current_user
  end

end
