class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate_request!

  def show
    user = User.find(params[:id])
    render json: user
  end
end