class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :company_name, :subdomain, :email, :password,
                                 :password_confirmation, :role_id, company_attributes: [:id, :name])
  end

  def account_update_params
    params.require(:user).permit(:name, :company_name, :subdomain, :avatar, :email,
                                 :password, :password_confirmation, :current_password, :role_id, company_attributes: [:id, :name])
  end

  # def after_inactive_sign_up_path_for(resource_or_scope)
  #   session["user_return_to"] || root_path
  # end

end