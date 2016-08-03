class RegistrationsController < Devise::RegistrationsController
	before_action :GetRoles
	
	def GetRoles
		@roles = Role.all
	end

  private

  def sign_up_params
    params.require(:user).permit(:nombre, :apaterno, :amaterno, :telefono, :color_id, :role_id, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:nombre, :apaterno, :amaterno, :telefono, :color_id, :role_id, :email, :password, :password_confirmation, :current_password)
  end
end