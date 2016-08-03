class WelcomeController < ApplicationController
	before_action :GetUserData
	before_action :checkAdminUser
	before_action :authenticate_user!

	def index
	end

	def dashboard
	end

	def variety
	end

	def GetRolesUsuario
		@roles = Role.all
	end

	def checkAdminUser
		@user = User.where(:role_id => 1, :id => current_user.id).first
		if @user != nil
			render :dashboard
		else
			render :index
		end
	end

	def GetUserData
	  @usuario = current_user.nombre + " " + current_user.apaterno
	  @colorUno = current_user.color.color
	  @colorDos = current_user.color.colorsec
      @rolUsuario = current_user.role.id
  	end
end
