class AddClientIdToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :client, index: true, foreign_key: true
  end
end
