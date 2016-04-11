class InvitationsController < Devise::InvitationsController


  private
  def invite_params
     params.permit(user: [:name, :email, :invitation_token, :company_id, :role_id])[:user]
  end


end