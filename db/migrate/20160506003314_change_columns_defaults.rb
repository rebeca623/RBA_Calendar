class ChangeColumnsDefaults < ActiveRecord::Migration
  def change
  		change_column :users, :color_id, :integer, :default => 14, :null => false
  		change_column :users, :role_id, :integer, :null => false
  		change_column :users, :nombre, :string, :default => "", :null => false
  		change_column :users, :apaterno, :string, :default => "", :null => false
  end
end
