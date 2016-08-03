class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :GetUserData

  def index
  	@users = User.all
  	@roles = Role.all
  end

  def variety

  end

  def show
  	@users = User.find(params[:id])
  end

  def GetUserData
    @usuario = current_user.nombre + " " + current_user.apaterno
    @colorUno = current_user.color.color
    @colorDos = current_user.color.colorsec
    @rolUsuario = current_user.role.id
    @userEmail = current_user.email
    @userTel = current_user.telefono
    @userIp = current_user.current_sign_in_ip
    @userLastSes = current_user.last_sign_in_at.strftime('%FT%R').to_s
    @userCreate = current_user.created_at.strftime('%FT%R').to_s
  end

  def ChangeUserColor
      oldColor = User.find(current_user.id)
      oldColor = oldColor.color_id
      @user = User.where(:id => current_user.id).update_all(:color_id => params[:color])
      oldColor = Color.where(:id => oldColor).update_all(:used => false)
      newColor = Color.where("id = ?", params[:color]).update_all(:used => true)

      respond_to do |f|
          f.json { render :text => "Cambio de apariencia exitoso".to_json }
      end
      
  end

  def update
  	@user = User.find(params[:id])

  	if @user.update_attributes(secure_params)
  		redirect_to root_path, :notice => "No problem"
  	else
  		redirect_to root_path, :notice => "Something went wrong"
  	end

  	private
  	def secure_params
  		params.require(:user).permit(:role)
  	end
  end
end