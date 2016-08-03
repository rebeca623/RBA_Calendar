class MonthlyController < ApplicationController
	before_action :authenticate_user!
	before_action :GetUserData

  	def index
  	end

  	def GetUserData
	  	@usuario = current_user.nombre + " " + current_user.apaterno
	  	@colorUno = current_user.color.color
	  	@colorDos = current_user.color.colorsec
    	@rolUsuario = current_user.role.id
  end
end
