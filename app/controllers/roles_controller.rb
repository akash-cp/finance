class RolesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Role
    @roles = Role.all
  end

  def new
    authorize Role
    @role = Role.new
  end


  def create
    authorize Role
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path
    else
      render 'new'
    end

  end

  def edit
    authorize Role
    @role = Role.find_by(id: params[:id])
  end

  def update
    authorize Role
    @role = Role.find_by(id: params[:id])
    if @role.update_attributes(role_params)
      redirect_to roles_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize Role
    @role = Role.find_by(id: params[:id])
    if @role.destroy
      redirect_to roles_path
    end
  end

  private
  def role_params
    params.require(:role).permit(:title, :company_id, :can_view_income, :can_create_income, :can_edit_income, :can_delete_income,
                                 :can_view_expense, :can_create_expense, :can_edit_expense, :can_delete_expense,
                                 :can_view_income_category, :can_create_income_category, :can_edit_income_category, :can_delete_income_category,
                                 :can_view_expense_category, :can_create_expense_category, :can_edit_expense_category, :can_delete_expense_category,
                                 :can_view_user, :can_invite_user, :can_edit_user, :can_delete_user,
                                 :can_view_role, :can_create_role, :can_edit_role, :can_delete_role)
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

end