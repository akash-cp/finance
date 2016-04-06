class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # if request.subdomain == current_user.company.subdomain
    #   home_index_url(:subdomain => resource.company.subdomain)
    # else
    #   destroy_user_session_url(subdomain: request.subdomain)
    #   root_url(subdomain: nil)
    # end
   home_index_url(:subdomain => resource.company.subdomain)
  end

  def after_sign_out_path_for(resource)
    root_url(subdomain: nil)
  end

  def company
    current_user.company
  end

end