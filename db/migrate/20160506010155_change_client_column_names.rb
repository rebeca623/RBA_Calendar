class ChangeClientColumnNames < ActiveRecord::Migration
  def change
  		rename_column :clients, :nombre, :nombreClt
  		rename_column :clients, :apaterno, :apaternoClt
  		rename_column :clients, :amaterno, :amaternoClt
  		rename_column :clients, :email, :emailClt
  		rename_column :clients, :telefono, :telefonoClt
  end
end
