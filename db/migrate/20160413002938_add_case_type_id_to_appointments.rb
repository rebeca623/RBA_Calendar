class AddCaseTypeIdToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :case_type, index: true, foreign_key: true
  end
end
