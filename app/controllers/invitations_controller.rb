class InvitationsController < Devise::InvitationsController


  private
  def invite_params
     #params.permit(:name, :email, :invitation_token)
     params.permit(user: [:name, :email,:invitation_token, :company_id])[:user]

  end

  # devise_parameter_sanitizer.for(:invite) do |u|
  #   u.permit(:name, :email, :password, :password_confirmation, :invitation_token)
  # end
end