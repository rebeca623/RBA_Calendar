class AddDefaultToStatus < ActiveRecord::Migration
  def change
  		change_column :appointments, :status_app, :integer, :default => 1
  end
end
