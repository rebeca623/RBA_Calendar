class AddNameApaternoAmaternoTelEmailToUser < ActiveRecord::Migration
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apaterno, :string
  	add_column :users, :amaterno, :string
  	add_column :users, :telefono, :string

  	remove_column :users, :employee_id
  end
end
