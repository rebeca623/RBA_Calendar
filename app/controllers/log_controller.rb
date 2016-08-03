class LogController < ApplicationController
	
	def GetUserInformation
		if current_user.role_id == 3 || current_user.role_id == 4
			msg = "No tienes permisos para esta operacion"
			respond_to do |format|
				format.json { render :text => msg.to_json }
			end
		else
			@user = User.joins(:color).where(:id => params[:user]).select("nombre,apaterno,email,telefono,last_sign_in_at as fechaSsn,last_sign_in_ip as ip,color as color1,colorsec as color2,status")
			respond_to do |format|
				format.json { render :text => @user.to_json }
			end
		end
	end

	def GetFullLog
		user = params[:user_id]
		action = params[:action_id]
		date1 = params[:date1]
		date2 = params[:date2]

		@action = History.joins(:user).select("nombre, apaterno, fechaLog, detalles, ubicacion").all

		if user == "" && action == "" && date1 == "" && date2 == ""
			respond_to do |format|
				format.json { render :text => @action.to_json  }
			end
		else
			if user != nil && action == "" && date1 == "" && date2 == "" 
				@actions = History.joins(:user).select("nombre, apaterno, fechaLog, detalles, ubicacion").where(:user_id => user).all
			elsif user == "" && action != nil && date1 == "" && date2 == ""
				@actions = History.joins(:user).select("nombre, apaterno, fechaLog, detalles, ubicacion").where(:action_id => action).all
			elsif user == "" && action == "" && date1 != nil && date2 != nil
				@actions = History.joins(:user).select("nombre, apaterno, fechaLog, detalles, ubicacion").where("fechaLog > ? AND fechaLog < ?",date1,date2).all
			elsif user != nil && action != nil && date1 != nil && date2 != nil
			 	@actions = History.joins(:user).select("nombre, apaterno, fechaLog, detalles, ubicacion").where("user_id = ? AND action_id = ? AND fechaLog > ? AND fechaLog < ?",user,action,date1,date2).all
			end

			respond_to do |format|
				format.json { render :text => @actions.to_json  }
			end
		end
	end

	def GetLogActions
		@actions = Action.all
		respond_to do |format|
			format.json { render :text => @actions.to_json }
		end
	end

	def GetUserCaseTypes
		usr = params[:usr]

		if usr == "" || usr == nil
			@userCases = Assignment.joins(:case_type).joins(:user).where(:user_id => current_user.id).select("case_type_id as id, tipoCaso").all
		else
			@userCases = Assignment.joins(:case_type).joins(:user).where(:user_id => usr).select("case_type_id as id, tipoCaso").all
		end

		respond_to do |format|
			format.json { render :text => @userCases.to_json } 
		end
	end

	def GetAllCaseTypes
		@caseTypes = CaseType.select("id,tipoCaso").all
		respond_to do |format|
			format.json { render :text => @caseTypes.to_json }
		end
	end

	def SetUserTask
		user = params[:user]

		if user == "" || user == nil
			@assingCheck = Assignment.where(:user_id => current_user.id, :case_type_id => params[:task]).count
			CountAnsSave(@assingCheck,nil)
		else
			@assingCheck = Assignment.where(:user_id => user, :case_type_id => params[:task]).count
			CountAnsSave(@assingCheck,user)
		end

		
	end

	def CountAnsSave(count,user)
		if count > 0
			respond_to do |format|
				format.json { render :text => count }
			end
		else
			if user == nil
				@newUserTask = Assignment.create(:user_id => current_user.id, :case_type_id => params[:task])
			else
				@newUserTask = Assignment.create(:user_id => user, :case_type_id => params[:task])
			end

			if @newUserTask.save
				if user == nil
					@cases = Assignment.joins(:case_type).joins(:user).where(:user_id => current_user.id).select("case_type_id as id, tipoCaso").all
				else
					@cases = Assignment.joins(:case_type).joins(:user).where(:user_id => user).select("case_type_id as id, tipoCaso").all
				end

				respond_to do |format|
					format.json { render :text => @cases.to_json }
				end
			else
				respond_to do |format|
					format.json { render :json => "Something went wrong" }
				end
			end
		end
	end

	def TaskRemove
		user = params[:user]

		if user == nil || user == ""
			@userTask = Assignment.where(:user_id => current_user.id, :case_type_id => params[:ctype]).delete_all
			@cases = Assignment.joins(:case_type).joins(:user).where(:user_id => current_user.id).select("case_type_id as id, tipoCaso").all
		else
			@userTask = Assignment.where(:user_id => user, :case_type_id => params[:ctype]).delete_all
			@cases = Assignment.joins(:case_type).joins(:user).where(:user_id => user).select("case_type_id as id, tipoCaso").all
		end

		respond_to do |format|
			format.json { render :text => @cases.to_json }
		end
	end

	def GetUsersLog
		@users = User.all
		respond_to do |format|
			format.json { render :text => @users.to_json }
		end
	end

	def SetVacationPeriod
		startDate = params[:start]
		endDate = params[:end]
		comment = params[:comment]

		@vacation = Vacation.create(:startDate => startDate, :endDate => endDate, :comment => comment, :user_id => current_user.id)

		if @vacation.save
			respond_to do |format|
				format.json { render :text => @vacation.to_json }
			end
		else
			respond_to do |format|
				format.json { render json: @vacation.errors, status: :unprocesable_entity }
			end
		end

	end

	def GetUsersByStatus
		status = params[:status]
		role = params[:role]

		@users = User.select("id, nombre, apaterno, email, telefono, role_id as rol, created_at as fechaIng, status, current_sign_in_ip as ip").all

		if status != "" && role == ""
			@users = User.where(:status => status).select("id, nombre, apaterno, email, telefono, role_id as rol, created_at as fechaIng, status, current_sign_in_ip as ip").all
		elsif status == "" && role != ""
			@users = User.where(:role_id => role).select("id, nombre, apaterno, email, telefono, role_id as rol, created_at as fechaIng, status, current_sign_in_ip as ip").all
		elsif status != "" && role != ""
			@users = User.where(:role_id => role, :status => status).select("id, nombre, apaterno, email, telefono, role_id as rol, created_at as fechaIng, status, current_sign_in_ip as ip").all
		end 

		respond_to do |format|
			format.json { render :text => @users.to_json }
		end
			
	end

	#TEMP
	def colorList
		#@color = User.joins(:color).select("color as color1, colorsec, nombre, apaterno, used").all
		@color = Color.where("used != ?",true).select("id, color as color1, colorsec as color2").all
		respond_to do |f|
			f.json { render :text => @color.to_json }
		end
	end
end