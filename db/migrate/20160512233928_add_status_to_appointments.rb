class AddStatusToAppointments < ActiveRecord::Migration
  def change
  		add_column :appointments, :status_app, :integer
  end
end
