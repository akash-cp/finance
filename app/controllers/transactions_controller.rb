class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = company.users

    if params[:start_date].nil?
      params[:start_date] = Date.today.beginning_of_month
      params[:end_date] = Date.today.end_of_month
    else
      params[:start_date] = params[:start_date].first
      params[:end_date] = params[:end_date].first
      params[:start_date] = Date.today.beginning_of_month unless params[:start_date].present?
      params[:end_date] = Date.today.end_of_month unless params[:end_date].present?
    end

    @transactions = company.transactions.filter(filter_params(params)).paginate(page: params[:page])

    # if !params[:start_date].nil? and !params[:end_date].nil?
    #   @transactions = @transactions.range(Date.parse(params[:start_date].to_s), Date.parse(params[:end_date].to_s)) if params[:start_date].first.present? and params[:end_date].first.present?
    # end
    # @transactions = @transactions.for_user(params[:user_id]) if params[:user_id].present?
    # @transactions = @transactions.for_type(params[:type]) if params[:type].present? and params[:type] != 'All'
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :type)
  end


end