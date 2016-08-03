class AddFieldsAboutAppointmentTimes < ActiveRecord::Migration
  def change
  		add_column(:appointments, :tipoCita, :integer)
  		add_column(:clients, :numCaso, :integer)
  end
end
