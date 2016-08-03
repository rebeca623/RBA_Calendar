class RenameEmployeeToUserInHascasetypes < ActiveRecord::Migration
  def change
  		#rename_column :has_case_type, :employee_id, :user_id
  		remove_index :has_case_types, :employee_id
  		rename_column :has_case_types, :employee_id, :user_id
  		add_index :has_case_types, :user_id
  end
end
