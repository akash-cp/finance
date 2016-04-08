class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = company.users

    params[:start_date] = Date.today.beginning_of_month.strftime('%d-%m-%Y') unless params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d-%m-%Y') unless params[:end_date].present?

    @transactions = company.transactions.filter(filter_params(params)).paginate(page: params[:page])
    @transaction_type_count = Transaction.all.group(:transactionable_type).count

    respond_to do |format|
      format.html
      format.pdf
      format.xls
    end
  end

  def filter_params(params)
    params.slice(:user_id, :start_date, :end_date, :type)
  end


end