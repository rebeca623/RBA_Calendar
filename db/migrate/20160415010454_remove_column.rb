class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :employees, :email
  end
end
