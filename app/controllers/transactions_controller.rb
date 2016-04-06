class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    company = current_user.company
    @transactions = company.transactions.paginate(page: params[:page])
    @users = company.users
    if !params[:start_date].nil? and !params[:end_date].nil?
      @transactions = @transactions.range(Date.parse(params[:start_date].to_s), Date.parse(params[:end_date].to_s)) if params[:start_date].first.present? and params[:end_date].first.present?
    end
    @transactions = @transactions.for_user(params[:user_id]) if params[:user_id].present?
    @transactions = @transactions.for_type(params[:type]) if params[:type].present? and params[:type] != 'All'
  end

end