class WelcomeController < ApplicationController

  def index
    if params[:q]
      if Company.where(subdomain: params[:q]).count > 0
        redirect_to new_user_session_url(subdomain: params[:q])
      else
        redirect_to new_user_registration_url(subdomain: params[:q])
      end
    end
  end

end
