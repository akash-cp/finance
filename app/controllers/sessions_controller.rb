class SessionsController < Devise::SessionsController

  def new
    if request.subdomain.present? and request.subdomain != 'www' and Company.exists?(subdomain: request.subdomain)
      super
    else
      redirect_to root_url(subdomain: nil)
    end
  end
end