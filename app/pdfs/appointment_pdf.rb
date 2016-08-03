class AppointmentPdf < Prawn::Document
	def initialize(appointments)
		super()
		@appointments = appointments
		text_content
		table_content
	end

	def text_content 
		y_position = cursor - 50

	    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
	    bounding_box([0, y_position], :width => 270, :height => 50) do
	      text "Rudolph Baker & Associates", size: 15, style: :bold
	      text "Asesor: " + @appointments.first.nombre.to_s + " " + @appointments.first.apaterno.to_s
	      text " "
	    end

	    bounding_box([300, y_position], :width => 270, :height => 50) do
	      text "Fecha: " + @appointments.first.fecha.strftime('%v').to_s, size: 15, style: :bold
	    end
	end

	def table_content
		table appointments_rows do
			row(0).font_style = :bold
			self.header = true
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.column_widths = [40,80,80,120,80,80]
		end
	end

	def appointments_rows
		#"id", "client_id, tipocaso, nombre, apaterno, color_id, fecha, hora, nombreClt, apaternoClt, numpersonas, comentario, telefonoClt, emailClt, attendance"
		[["Hora","Num. Caso","Nombre del Cliente","Telefono","Asistencia"]] +
		@appointments.map do |app|
			asistencia = "Sin confirmar"
			if app.attendance.to_s == "false"
				asistencia = "No atendio"
			elsif app.attendance.to_s == "true"
				asistencia = "Atendio"
			else
				asistencia = "Sin confirmar"
			end

			time = Time.new
			time = app.hora

			[time.strftime('%r'),app.numCaso.to_s, app.nombreClt.to_s + " " + app.apaternoClt.to_s, app.telefonoClt.to_s, asistencia ]
		end
	end
end