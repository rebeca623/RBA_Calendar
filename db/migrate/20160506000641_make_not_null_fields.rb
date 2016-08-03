class MakeNotNullFields < ActiveRecord::Migration
  def change
  		change_column :users, :color_id, :integer, :default => 14, :null => false
  		change_column :users, :role_id, :integer, :default => 4, :null => false
  		change_column :users, :nombre, :string, :default => "Usuario", :null => false
  		change_column :users, :apaterno, :string, :default => "Nuevo", :null => false
  end
end
