class AddAppointmentTime < ActiveRecord::Migration
  def change
  		add_column :case_types, :duration_type, :integer
  end
end
