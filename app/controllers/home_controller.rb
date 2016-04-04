class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @invited_for_company = User.where(company_id: @user.company_id)
  end

  def show

  end

  def edit

  end

end
