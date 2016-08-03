class AddFieldAttendanceToAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :attendance, :boolean
  end
end
