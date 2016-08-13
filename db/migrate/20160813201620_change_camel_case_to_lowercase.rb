class ChangeCamelCaseToLowercase < ActiveRecord::Migration
  def change
  		rename_column :appointments, :tipoCita, :tipocita
  		rename_column :case_types, :tipoCaso, :tipocaso
  		rename_column :clients, :nombreClt, :nombreclt
  		rename_column :clients, :apaternoClt, :apaternoclt
  		rename_column :clients, :amaternoClt, :amaternoclt
  		rename_column :clients, :emailClt, :emailclt
  		rename_column :clients, :telefonoClt, :telefonoclt
  		rename_column :clients, :telefonoClt, :telefonoclt
  		rename_column :clients, :numCaso, :numcaso
  		rename_column :histories, :fechaLog, :fechalog
  		rename_column :vacations, :startDate, :startdate
  		rename_column :vacations, :endDate, :enddate
  		change_column :users, :color_id, :integer, :default => 1, :null => false
  		change_column :users, :status, :integer, :default => 1, :null => false
  end
end
