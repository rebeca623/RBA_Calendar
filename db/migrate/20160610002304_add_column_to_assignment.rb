class AddColumnToAssignment < ActiveRecord::Migration
  def change
  	add_column :assignments, :user_id, :integer
  	add_column :assignments, :case_type_id, :integer
  end
end
