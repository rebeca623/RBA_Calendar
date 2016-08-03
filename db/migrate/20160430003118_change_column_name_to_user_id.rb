class ChangeColumnNameToUserId < ActiveRecord::Migration
  def change
  	rename_column :appointments, :employee_id, :user_id
  	add_foreign_key :appointments, :user
  end
end
