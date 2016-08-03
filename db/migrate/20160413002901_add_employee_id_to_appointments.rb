class AddEmployeeIdToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :employee, index: true, foreign_key: true
  end
end
