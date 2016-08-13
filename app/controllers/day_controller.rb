class DayController < ApplicationController
  	before_action :authenticate_user!
  	before_action :GetUserData
    before_action :GetAbogadosCasos
	
  	def index
      @appointments = Appointment.joins(:client).joins(:user).joins(:case_type).where("status_app = 1 AND user_id = ? AND fecha = ?", current_user.id, params[:fecha]).all.select("numcaso", "client_id, tipocaso, nombre, apaterno, color_id, fecha, hora, nombreclt, apaternoclt, numpersonas, comentario, telefonoclt, emailclt, attendance")
      #@appointments = Appointment.where(:user_id => current_user.id,:fecha => params[:fecha])
      respond_to do |format|
          format.html
          format.pdf do 
              pdf = AppointmentPdf.new(@appointments)
              send_data pdf.render, filename: "schedule.pdf", type: 'application/pdf'
          end
      end
  	end

  	def GetUserData
  	  	@usuario = current_user.nombre + " " + current_user.apaterno
  	  	@colorUno = current_user.color.color
  	  	@colorDos = current_user.color.colorsec
      	@rolUsuario = current_user.role.id
    end

    def GetAppointments
        if current_user.role_id != 4
    			 @appointments = Appointment.joins(:client).joins(:user).joins(:case_type).where("status_app = 1 AND user_id = ? AND fecha = ?", current_user.id,params[:fecha]).all.select("id", "client_id, tipocaso, nombre, apaterno, color_id, fecha, hora, nombreclt, apaternoclt, numpersonas, comentario, telefonoclt, emailclt, attendance")
    		else
    			 @appointments = Appointment.joins(:client).joins(:user).joins(:case_type).where("status_app = 1 AND fecha = ?", params[:fecha]).all.select("id", "user_id, client_id, tipocaso, nombre, apaterno, color_id, fecha, hora, nombreclt, apaternoclt, numpersonas, comentario, telefonoclt, emailclt, attendance")
    		end

    		respond_to do |format|
    			 format.json { render :text => @appointments.to_json }
    		end
    end

    def printSchedule
         
    end

    def GetAbogadosCasos
        #Validar ROLE en el LOgin para seleccionar asesor de consulta.
        if current_user.role_id == 1 || current_user.role_id == 2 || current_user.role_id == 4
            @abogados = User.where("role_id != 4 AND role_id != 1 ")
        else current_user.role_id == 3
            @abogados = User.where("role_id = 3 AND id = ?", current_user.id)
        end

        @tipocasos = CaseType.all
    end

    def getAllUsers
        @users = User.joins(:color).where("role_id != 4 AND role_id != 1").all.select("id","nombre","apaterno","color_id","color")

        respond_to do |format|
          format.json { render :json => @users }
        end
    end

    def GetAllColors
        @color = Color.all.select("id", "color", "colorsec")

        respond_to do |format|
          format.json { render :text => @color.to_json } 
        end
    end
end
